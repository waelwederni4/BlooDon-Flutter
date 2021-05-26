import 'package:bloodon/Controleurs/utils/SharedPrefs.dart';
import 'package:bloodon/Models/notif.dart';
import 'package:bloodon/Views/views/NotisCard.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
   List<Notif> NotifList =[
    Notif("l'hopital Habib Bourgiba à besoin du type sanguin AB+ en urgence s'il vous plaît soient à l'heure afin de sauver une vie", "+21675840065", "Centre ville sfax",
        1619231445, 1619314245)
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFAFAFAFA),
      child: new ListView.builder(
          itemCount: NotifList.length,
          itemBuilder: (BuildContext context, int index) =>
              NotisCard(NotifList[index])),
    );
    /*return Scaffold(
    body:FutureBuilder<List<Notif>>(
      future: SharedPrefs.getNotifications(),
      builder: (BuildContext context, AsyncSnapshot<List<Notif>> snapshot) {
        if (!snapshot.hasData) {
          // while data is loading:
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // data loaded:
          final List<Notif> NotifList = snapshot.data;

        }
      },
    ));*/
  }
}