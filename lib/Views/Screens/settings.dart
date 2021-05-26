import 'package:bloodon/Controleurs/Services/auth.dart';
import 'package:bloodon/Views/Screens/signin_with_phone.dart';
import 'package:bloodon/Views/views/choiceChipWidget.dart';
import 'package:bloodon/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_location/flutter_background_location.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool activeUpdate = true;
  bool newsUpdate = true;
  bool compagneUpdate = true;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color(0xFF8D1616),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            language(context, "Language"),
            about(context, "About"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Color(0xFF8D1616),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow(0,"Nouveau pour vous", newsUpdate),
            buildNotificationOptionRow(1,"Suivie Campagne", compagneUpdate),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Color(0xFF8D1616),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Location",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            updateposition("Update position", activeUpdate),
            SizedBox(
              height: 50,
            ),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  await _authService.signout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContinueWithPhone()),
                  );
                },
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  openAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: "BlooDon Mobile",
      applicationLegalese:
          "L'importance de cette application réside dans l'aide apportée aux patients qui ont un besoin urgent de sang Il fournit un environnement qui combine le donneur de sang et le nécessiteux sous la forme d'une application mobile associée à une application web il suffit de s'inscrire dans l'application Entrez simplement le numéro de téléphone pour vérifier votre identité.",
      applicationIcon: Image.asset(
        Assets.iconIcLauncher,
        height: 30,
        width: 30,
      ),
    );
  }

  Row buildNotificationOptionRow(int id,String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {
                setState(() {
                  if(id==0)
                    newsUpdate=val;
                  else compagneUpdate=val;
                });
              },
            ))
      ],
    );
  }

  Row updateposition(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {
                if (val)
                  FlutterBackgroundLocation.startLocationService();
                else
                  FlutterBackgroundLocation.stopLocationService();
                setState(() {
                  activeUpdate = val;
                });
              },
            ))
      ],
    );
  }

  GestureDetector about(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        openAboutDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector language(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    choiceChipWidget(["Fr", "Ar", "En"])
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
