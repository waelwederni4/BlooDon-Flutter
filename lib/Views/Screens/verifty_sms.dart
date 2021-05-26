import 'dart:async';

import 'package:bloodon/Controleurs/Services/auth.dart';
import 'package:bloodon/Controleurs/Services/firebase_api_service.dart';
import 'package:bloodon/Controleurs/utils/SharedPrefs.dart';
import 'package:bloodon/Controleurs/utils/constants.dart';
import 'package:bloodon/Views/Screens/Formulaire.dart';
import 'package:bloodon/my_app.dart';
import 'bottom_nav_screen.dart';
import 'package:bloodon/Views/views/toast.dart';
import 'package:bloodon/Controleurs/utils/UIUtils.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../views/numeric_pad.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyPhone extends StatefulWidget {

  final String phoneNumber;
 // final String verificationId;

  VerifyPhone({@required this.phoneNumber});

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String code = "";
  bool _loading = false;
  var onTapRecognizer;

  StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();

  bool _isCodeSent = false;
  String _verificationCode;
  void verifyPhone() async {
    if (!_isCodeSent) {
      await _authService.verifyPhone(_scaffoldkey,'+216${widget.phoneNumber}', enableButton);
    }
  }
  void enableButton() {
    setState(() {
      _isCodeSent = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => verifyPhone());
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Verify phone",
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                      child: Image.asset('assets/images/sms.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      child: Text(
                        "Veuillez saisir votre code du vérification de six chiffres reçu par sms, afin de valider votre numéro +216 " + widget.phoneNumber,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),


        Expanded(
                      child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            obscureText: false,
                            blinkWhenObscuring: true,
                            obscuringCharacter: '*',
                            animationType: AnimationType.fade,
                             pinTheme: PinTheme(
                               shape: PinCodeFieldShape.box,
                               selectedFillColor:Colors.white,
                               activeFillColor:Colors.white,
                               inactiveFillColor:Colors.white,
                               activeColor:Colors.black12,
                               selectedColor:Colors.black12,
                               inactiveColor:Colors.black12,
                               borderRadius: BorderRadius.circular(5),
                               fieldHeight: 60,
                               fieldWidth: 50,
                             ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            textStyle: TextStyle(fontSize: 20, height: 1.6),
                            backgroundColor: Colors.white,
                            enableActiveFill: true,
                            controller: textEditingController,
                            errorAnimationController: errorController,
                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                 offset: Offset(0, 1),
                                 color: Colors.black12,
                                 blurRadius: 10,
                               )
                             ],
                            onCompleted: (val) {
                              code = val;
                            },
                            beforeTextPaste: (text) {
                              return true;
                            },
                            onChanged: (String value) {},
                          )),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                          Text(
                            "Vous n'avez pas reçu de code?",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF818181),
                            ),
                          ),
                          
                          SizedBox(
                            width: 6,
                          ),

                          GestureDetector(
                            onTap: () {
                              print("Resend the code to the user");
                            },
                            child: Text(
                              "Renvoyer code",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
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
                          FocusScope.of(context).unfocus();
                              User user = await _authService
                                  .logIn(_scaffoldkey, code)
                                  .whenComplete(() => setState(() => _loading = true));
                              if (user != null) {
                                Map<String, dynamic> body = {
                                  'id': user.uid
                                };
                                await SharedPrefs.SaveUser(user);
                                Response response = await FirebaseApiService.create().IsExist(body);
                                print(response.body);
                                bool res=response.body;
                                if(res){
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return BottomNavScreen();
                                      }),
                                          (route) => false);
                                }else {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return Formulaire();
                                      }),
                                          (route) => false);
                                }
                              } else {
                                setState(() {
                                  _loading = false;
                                });
                              }
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
        )
      ),
    );
  }

  Widget buildCodeNumberBox() {
    String codeNumber;
    TextEditingController _controller = new TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75)
              )
            ],
          ),
          child: Center(
            child: TextField(
                controller: _controller,
                onChanged: (String newVal) {
                  if(newVal.length <= 1){
                    codeNumber = newVal;
                  }else{
                    _controller.value = new TextEditingValue(
                        text: codeNumber,
                        selection: new TextSelection(
                            baseOffset: 1,
                            extentOffset: 1,
                            affinity: TextAffinity.downstream,
                            isDirectional: false
                        ),
                        composing: new TextRange(
                            start: 0, end: 1
                        )
                    );
                    _controller.text = codeNumber;
                    code+=codeNumber;
                  }
                }
            ),
            ),
          ),
        ),
    );
  }
  @override
  void initState() {
    super.initState();
  }
}