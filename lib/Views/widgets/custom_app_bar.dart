import 'package:bloodon/Controleurs/Services/auth.dart';
import 'package:bloodon/Views/Screens/signin_with_phone.dart';
import 'package:flutter/material.dart';
import 'package:bloodon/Controleurs/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final AuthService _authService = AuthService();
  final String titel;

  CustomAppBar(this.titel);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(child: Text(titel, style: TextStyle(color: Colors.black))),
      elevation: 10.0,
      leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(
            "assets/icon/splash.png",
            height: 24,
          )),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
          iconSize: 28.0,
          onPressed: () async {
            await _authService.signout();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContinueWithPhone()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
