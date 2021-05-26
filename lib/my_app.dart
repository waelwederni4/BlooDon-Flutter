import 'package:bloodon/Views/Screens/bottom_nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Views/Screens/first_screen.dart';
import 'Controleurs/utils/store/theme_store.dart';
import 'Controleurs/utils/Strings.dart';
import 'Views/Screens/signin_with_phone.dart';
import 'main.dart';

class MyApp extends StatelessObserverWidget {
  static final  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    auth.setSettings(appVerificationDisabledForTesting: false);
   return  MaterialApp(
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor:Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      themeMode: Provider.of<ThemeStore>(context).themeMode,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home:_getwidget(auth.currentUser!=null),
    );
  }
  Widget _getwidget(bool b){
      if (b){
        return BottomNavScreen();
      }
      else{
        if (sharedPreferences.getBool("first_login")!=null && sharedPreferences.getBool("first_login")) {
          return ContinueWithPhone();
        }else{
          return FirstScreen();
        }
      }
  }
}