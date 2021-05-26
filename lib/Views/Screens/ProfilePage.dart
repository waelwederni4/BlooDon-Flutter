import 'package:bloodon/Controleurs/utils/SharedPrefs.dart';
import 'package:bloodon/Models/Donneur.dart';
import 'package:bloodon/Views/views/ChipsWidget.dart';
import 'package:bloodon/Views/views/choiceChipWidget.dart';
import 'package:bloodon/Views/views/filterChipWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final fb = FirebaseDatabase.instance;
  final FocusNode myFocusNode = FocusNode();
  TextEditingController nomController=new TextEditingController();
  TextEditingController prenomController=new TextEditingController();
  TextEditingController cinController=new TextEditingController();
  TextEditingController adresseController=new TextEditingController();
  TextEditingController type_sanguinController=new TextEditingController();
  TextEditingController regionController=new TextEditingController();
  TextEditingController phoneNumberController=new TextEditingController();
  filterChipWidget c1=filterChipWidget(chipName: 'Être âgé de 18 à 70 ans');
  filterChipWidget c2=filterChipWidget(chipName: 'Ne pas être à jeun');
  filterChipWidget c3=filterChipWidget(chipName: 'Être en forme');
  filterChipWidget c4=filterChipWidget(chipName: 'Peser au minimum 50 kilos');
  filterChipWidget c5=filterChipWidget(chipName: 'Consommer drogue');
  filterChipWidget c6= filterChipWidget(chipName: 'Vous avez un tatouage');
  filterChipWidget c7=filterChipWidget(chipName: 'Vous prenez un antibiotique');
  filterChipWidget c8=filterChipWidget(chipName: "Absence d'intervention chirurgicale récente");
  choiceChipWidget choice=choiceChipWidget([
    "AB+",
    "AB-",
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-"
  ]);
  Donneur donneur;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDonneur();
  }
  void getDonneur()async{
    Donneur don= Donneur.fromJson(await SharedPrefs.GetDonneur());
    setState((){
      donneur=don;
    });
  }
  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    if(donneur!=null) {
      nomController.text = donneur.nom;
      prenomController.text = donneur.prenom;
      cinController.text = donneur.cin;
      adresseController.text = donneur.adresse;
      type_sanguinController.text = donneur.type_sanguin;
      regionController.text = donneur.region;
      phoneNumberController.text = donneur.phoneNumber;
    }
    return new Scaffold(
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    height: 250.0,
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: new Stack(fit: StackFit.loose, children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: ExactAssetImage(
                                            'assets/images/wael.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 90.0, right: 100.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 25.0,
                                      child: new Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Informations personnel',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status ? _getEditIcon() : new Container(),
                                    ],
                                  )
                                ],
                              )),
                          _tete("Cin"),
                          _head(0, "Saisir Votre Cin", cinController,TextInputType.number),
                          _tete("Nom"),
                          _head(1, "Saisir Votre Nom", nomController,TextInputType.text),
                          _tete("Prenom"),
                          _head(2, "Saisir Votre Prenom", prenomController,TextInputType.text),
                          _tete("Numéro du Téléphone"),
                          _head(4, "Saisir Votre Numéro du Téléphone", phoneNumberController,TextInputType.text),
                          _tete("Adresse"),
                          _head(3, "Saisir Votre Adresse", adresseController,TextInputType.streetAddress),
                          _tete("Région"),
                          _head(5, "Saisir Votre Région", regionController,TextInputType.text),
                          _tete("Type Sanguin"),
                          _status ? TypeSang(donneur==null?"":donneur.type_sanguin):EditTypeSang(),
                          _tete("Conditions du dons"),
                          _status ? Maladie():EditMaladie(),
                          !_status ? _getActionButtons() : new Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }
  Widget _tete(String text){
    return Padding(
        padding: EdgeInsets.only(
            left: 25.0, right: 25.0, top: 25.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  text,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ));
  }
  Widget _head(int id,String text,TextEditingController controller,TextInputType inputType){
    return Padding(
        padding: EdgeInsets.only(
            left: 25.0, right: 25.0, top: 2.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Flexible(
                child: TextField(
                  keyboardType: inputType,
                  controller: controller,
                  onChanged: (value) {
                    switch(id){
                      case 0:
                        donneur.cin=value;
                        break;
                      case 1:
                        donneur.nom=value;
                        break;
                      case 2:
                        donneur.prenom=value;
                        break;
                      case 3:
                        donneur.adresse=value;
                        break;
                      case 4:
                        donneur.phoneNumber=value;
                        break;
                      case 5:
                        donneur.region=value;
                        break;
                    }
                    controller.text=value;
                  },
                  decoration: InputDecoration(
                    hintText: text,
                  ),
                  enabled: !_status,
                  autofocus: !_status,

                )
            ),
          ],
        ));
  }
  Widget TypeSang(String text){
    return Padding(
        padding: EdgeInsets.only(
            left: 25.0, right: 25.0, top: 2.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Flexible(
                child: Text(text,style: TextStyle(fontSize: 20.0),)
            ),
          ],
        ));
  }
  Widget Maladie(){
    if(donneur==null){return Container();}
    else {
      return Padding(
          padding: EdgeInsets.only(
              left: 25.0, right: 25.0, top: 2.0),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Flexible(
                  child: Container(
                      child: ListView.builder(
                        // Let the ListView know how many items it needs to build.
                        shrinkWrap:true,
                        itemCount: donneur.maladie.length,
                        // Provide a builder function. This is where the magic happens.
                        // Convert each item into a widget based on the type of item it is.
                        itemBuilder: (context, index) {
                          final item = donneur.maladie[index];
                          return ChipsWidget(chipName: item);
                        },
                      )
                  )),
            ],
          ));
    }
  }
  Widget EditMaladie(){
    return Padding(
        padding: EdgeInsets.only(
            left: 25.0, right: 25.0, top: 2.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Flexible(
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      c1,
                      c2,
                      c3,
                      c4,
                      c5,
                      c6,
                      c7,
                      c8,
                    ],
                  ),
                ),
            ),
          ],
        ));
  }
  Widget EditTypeSang(){
    return Padding(
        padding: EdgeInsets.only(
            left: 25.0, right: 25.0, top: 2.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Flexible(
                child: Container(
          child: Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: <Widget>[
            choice,
          ],
        ))
            ),
          ],
        ));
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        List<String> maladie=new List<String>() ;
                        if(c1.Selected!=null && c1.Selected)maladie.add(c1.chipName);
                        if(c2.Selected!=null && c2.Selected)maladie.add(c2.chipName);
                        if(c3.Selected!=null && c3.Selected)maladie.add(c3.chipName);
                        if(c4.Selected!=null && c4.Selected)maladie.add(c4.chipName);
                        if(c5.Selected!=null && c5.Selected)maladie.add(c5.chipName);
                        if(c6.Selected!=null && c6.Selected)maladie.add(c6.chipName);
                        if(c7.Selected!=null && c7.Selected)maladie.add(c7.chipName);
                        if(c8.Selected!=null && c8.Selected)maladie.add(c8.chipName);
                        if(maladie.isNotEmpty)donneur.maladie=maladie;
                        if(choice.selectedChoice.isNotEmpty)donneur.type_sanguin=choice.selectedChoice;
                        fb.reference().child("compte-donneur").child(donneur.id).set(donneur.toJson());
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}