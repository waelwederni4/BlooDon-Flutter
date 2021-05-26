import 'dart:convert';

import 'package:bloodon/Controleurs/Services/firebase_api_service.dart';
import 'package:bloodon/Controleurs/utils/SharedPrefs.dart';
import 'package:bloodon/Views/views/choiceChipWidget.dart';
import 'package:bloodon/Views/views/filterChipWidget.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_screen.dart';

class Formulaire extends StatefulWidget {
  @override
  _FormulaireState createState() => _FormulaireState();
}
class _FormulaireState extends State<Formulaire>
    with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime.now();

  final controller = ScrollController();
  bool passwordInvisible = true;
  String nom = "";
  String prenom = "";
  String cin = "";
  String adresse = "";
  String type_sanguin = "";
  String region = "";
  double offset = 0;
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

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Formulaire d'inscription",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: SingleChildScrollView(
          controller: controller,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(bottom: 1, top: 20, left: 20.0, right: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0),
                        blurRadius: 15.0),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, -10.0),
                        blurRadius: 10.0),
                  ]),
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("CIN :",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 22)),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        cin=value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Entrez votre numéro du carte identité.',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black12, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF8D1616), width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:8,
                    ),Text("Nom :",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 22)),
                    TextField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        nom=value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Entrez votre nom.',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black12, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF8D1616), width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Prénom :",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 22)),
                    TextField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        prenom=value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Entrez votre prénom.',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black12, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF8D1616), width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Region :",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 22)),
                    TextField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        region=value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Entrez votre region.',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black12, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF8D1616), width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                    ),Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Row(

                        children: <Widget>[

                          Text(
                            "Date naissance :",
                            style: TextStyle(fontFamily: "Poppins", fontSize: 22),
                          ),

                          SizedBox(
                            width: 8,
                          ),

                          GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: TextStyle(fontFamily: "Poppins",fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),

                        ],
                      ),
                    ),SizedBox(
                      height: 8,
                    ),Text("Adresse :",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 22)),
                TextField(
                  keyboardType: TextInputType.streetAddress,
                  onChanged: (value) {
                    adresse=value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Entrez votre adresse.',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.black12, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFF8D1616), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                  ),
                ),SizedBox(
                      height: 8,
                    ),
                    Text("Type Sanguin :",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 22)),
                    Container(
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children: <Widget>[
                            choice,
                          ],
                        )),
                SizedBox(
                height: 8,
              ),
                    Text("Conditions :",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 22)),
                   Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Align
                        (
                        alignment: Alignment.centerLeft,
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
                    ),
                    SizedBox(
                      height: 8,
                    ),Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[

                            Expanded(
                              child: GestureDetector(
                                onTap: () async{
                                  sendData();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8D1616),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
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

  sendData() async {
    List<String> maladie=new List<String>() ;
    if(c1.Selected!=null && c1.Selected)maladie.add(c1.chipName);
    if(c2.Selected!=null && c2.Selected)maladie.add(c2.chipName);
    if(c3.Selected!=null && c3.Selected)maladie.add(c3.chipName);
    if(c4.Selected!=null && c4.Selected)maladie.add(c4.chipName);
    if(c5.Selected!=null && c5.Selected)maladie.add(c5.chipName);
    if(c6.Selected!=null && c6.Selected)maladie.add(c6.chipName);
    if(c7.Selected!=null && c7.Selected)maladie.add(c7.chipName);
    if(c8.Selected!=null && c8.Selected)maladie.add(c8.chipName);
    String date= "${selectedDate.toLocal()}".split(' ')[0];
    String id=await SharedPrefs.GetUser();
    type_sanguin=choice.selectedChoice;
    if(cin.isNotEmpty && nom.isNotEmpty && prenom.isNotEmpty && adresse.isNotEmpty && region.isNotEmpty && date.isNotEmpty && type_sanguin!=null&&type_sanguin.isNotEmpty){
      Map<String, dynamic> data = {
        'cin':cin,
        'nom':nom,
        'prenom':prenom,
        'adresse':adresse,
        'region':region,
        'date':date,
        'type_sanguin':type_sanguin,
        'maladie':jsonEncode(maladie)

      };
      Map<String, dynamic> body = {
        'id': id,
        'data':data
      };
      Response response = await FirebaseApiService.create().UpdateClient(body);
      print(response.body);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return BottomNavScreen();
    }), (route) => false);
    }
  }
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1980),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
