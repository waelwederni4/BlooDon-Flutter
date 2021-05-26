import 'package:bloodon/Controleurs/utils/SharedPrefs.dart';
import 'package:bloodon/Models/first_screen_model.dart';
import 'package:bloodon/Views/Screens/SKOnboardingScreen.dart';
import 'package:flutter/material.dart';


import 'signin_with_phone.dart';
import '../views/flutter_image_viewpager.dart';
import '../../generated/assets.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  AnimationController _controller;
  static List<String> images = [
    "assets/images/subscription_ad0.png",
    "assets/images/subscription_ad1.png",
    "assets/images/subscription_ad2.png",
    "assets/images/subscription_ad3.png",
  ];
  final pages = [
    FirstScreenModel(
        title: 'Notification',
        description:
        'Recevoir les notifications en temps reel pour participer au don',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding1.png'),
    FirstScreenModel(
        title: 'Formulaire',
        description:
        'Remplir un formulaire simple pour s’inscrire au don',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding2.png'),

    FirstScreenModel(
        title: 'Campagne de dons',
        description: 'Participer à la compétition du meilleur donneur de la semaine',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding3.png'),
    FirstScreenModel(
        title: 'Localiser votre position',
        description: 'Indiquer votre localisation et choisir le plus proche centre',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding4.png'),
  ];
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu,size: 30,
              color: Colors.black,),
            onPressed: () => openMenuBottomSheet(context),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          textTheme: Theme.of(context).textTheme,
        ),
        body: FirstScreenTheme(
          bgColor: Colors.white,
          themeColor: const Color(0xFF8D1616),
          pages: pages,
          skipClicked: (value)async {
            await SharedPrefs.FirstLogin();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContinueWithPhone()),
            );
          },
          getStartedClicked: (value)async {
            await SharedPrefs.FirstLogin();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContinueWithPhone()),
            );
          },
        )
        );
  }

  Widget buildPage(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 42, color: Colors.white),
          ),
        ),
      ),
    );
  }

  openMenuBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Material(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                title: Text('About'),
                onTap: () => openAboutDialog(context),
              ),
              Divider(),
            ],
          ),
        );
      },
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
}
