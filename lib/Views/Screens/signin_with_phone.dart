import 'package:bloodon/Views/views/toast.dart';
import 'package:bloodon/Controleurs/utils/UIUtils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views/numeric_pad.dart';
import 'verifty_sms.dart';
import '../views/flutter_masked_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../my_app.dart';


class ContinueWithPhone extends StatefulWidget {
  @override
  _ContinueWithPhoneState createState() => _ContinueWithPhoneState();
}

class _ContinueWithPhoneState extends State<ContinueWithPhone> {
  String _message = '';
  String _verificationId;
  String phoneNumber = "";
  MagicMask mask = MagicMask.buildMask('99 999 999');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "S'inscrire Avec Téléphone",
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
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFF7F7F7),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/mobile_verfi.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    child: Text(
                      "Veuillez saisir votre numéro du téléphone  afin de recevoir  un code de vérification",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF6A6A6A),
                      ),
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
                  Container(
                    width: 230,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Entrer Numéro Téléphone",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "+216 " + mask.getMaskedString(phoneNumber),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: () async {
                        if (phoneNumber.isNotEmpty) {
                          //await _verifyPhoneNumber();
                          //final response = await Provider.of<PostApiService>(context).getPost("+21625488161");
                          // We cannot really add any new posts using the placeholder API,
                          // so just print the response to the console
                         // print(response.body);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return VerifyPhone(
                                  phoneNumber: phoneNumber);
                            }),
                          );
                        } else {
                          UIUtils.showToast(
                              "Phone Number is Empty", context, Colors.red,
                              gravity: Toast.bottom);
                        }
                      },
                      child: Container(
                        height: 60.0,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(blurRadius: 30.0, color: Colors.black12)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22.0)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 60.0,
                              width: 100.0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 12.0),
                              child: Text(
                                "Submit",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.button.apply(
                                    color: Colors.white, fontSizeFactor: 1.3),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xFF8D1616),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(95.0),
                                      topLeft: Radius.circular(95.0),
                                      bottomRight: Radius.circular(200.0))),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 30.0,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          NumericPad(
            onNumberSelected: (value) {
              setState(() {
                if (value != -1) {
                  if (phoneNumber.length < 8) {
                    phoneNumber = phoneNumber + value.toString();
                  }
                } else {
                  phoneNumber =
                      phoneNumber.substring(0, phoneNumber.length - 1);
                }
              });
            },
          ),
        ],
      )),
    );
  }

  Future<void> _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });

    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await MyApp.auth.signInWithCredential(phoneAuthCredential);
      UIUtils.showToast(
          'Phone number automatically verified and user signed in: $phoneAuthCredential',
          context,
          Colors.red,
          gravity: Toast.bottom);
    };

    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      UIUtils.showToast('Please check your phone for the verification code.',
          context, Colors.red,
          gravity: Toast.bottom);
      _verificationId = verificationId;
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    try {
      await MyApp.auth.verifyPhoneNumber(
          phoneNumber: '+216$phoneNumber',
          timeout: const Duration(seconds: 5),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      UIUtils.showToast(
          'Failed to Verify Phone Number: $e', context, Colors.red,
          gravity: Toast.bottom);
    }
  }
}
