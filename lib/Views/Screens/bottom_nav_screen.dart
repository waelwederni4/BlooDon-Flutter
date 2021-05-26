import 'dart:async';

import 'package:bloodon/Controleurs/utils/SharedPrefs.dart';
import 'package:bloodon/Controleurs/utils/UIUtils.dart';
import 'package:bloodon/Models/notif.dart';
import 'package:bloodon/Models/donneurlocation.dart';
import 'package:bloodon/Views/Screens/ProfilePage.dart';
import 'package:bloodon/Views/Screens/search_widget.dart';
import 'package:bloodon/Views/widgets/custom_app_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:bloodon/Views/Screens/home_screen.dart';
import 'package:bloodon/Views/Screens/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_background_location/flutter_background_location.dart';

import 'notifications_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  final FirebaseMessaging _fcm= FirebaseMessaging.instance;
  final List _screens = [
    HomeScreen(),
    NotificationsScreen(),
    ProfilePage(),
    SettingsPage(),
  ];
  final List<String> titels = [
    "Acceuil",
    "Notifications",
    "Profile",
    "Parametre",
  ];
  @override
  void initState(){
    super.initState();
    FlutterBackgroundLocation.startLocationService();
    UIUtils.pushPostion();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message data: ${message.data}');
      if (message.data.containsKey("donation")) {
        int deadline=int.parse(message.data['deadline']as String);
        int time=int.parse(message.data['time'] as String);
        Notif notif=new Notif(message.data['donation'] as String, message.data['contact'] as String, message.data['adresse'] as String,time,deadline);
        print("notiff : " +notif.map.toString());
        SharedPrefs.setNotifications(notif);
      }
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    UIUtils.saveToken(_fcm);
  }
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(titels[currentIndex]),
      backgroundColor: Color(0xFAFAFAFA),
      body: Stack(
        children: [
          _screens[currentIndex]
        ],
      ),bottomNavigationBar: Container(
        height: 80,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(backgroundColor:  Color(0xFF8D1616), child: Icon(Icons.search), elevation: 0.1, onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              }),
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: currentIndex == 0 ?  Color(0xFF8D1616) : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      setBottomBarIndex(0);
                    },
                    splashColor: Colors.white,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: currentIndex == 1 ?  Color(0xFF8D1616) : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        setBottomBarIndex(1);
                      }),
                  Container(
                    width: size.width * 0.20,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.person,
                        color: currentIndex == 2 ?  Color(0xFF8D1616) : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        setBottomBarIndex(2);
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: currentIndex == 3 ?  Color(0xFF8D1616) : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        setBottomBarIndex(3);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    FlutterBackgroundLocation.stopLocationService();
    super.dispose();
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black,10,true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}
