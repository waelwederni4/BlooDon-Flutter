import 'package:bloodon/Controleurs/Services/firebase_api_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_background_location/flutter_background_location.dart';

import 'SharedPrefs.dart';
import 'package:bloodon/Views/views/toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class UIUtils{
static void showToast(String msg,BuildContext context, MaterialColor color, {int duration, int gravity}) {
  Toast.show(msg,color, context, duration: duration, gravity: gravity);
}
static void saveToken(FirebaseMessaging _fcm)async{
  String token=await _fcm.getToken();
  if(token!=null){
    Map<String, dynamic> body = {
      'id': await SharedPrefs.GetUser(),
      'key':10,
      'value':token
    };
    Response response = await FirebaseApiService.create().UpdateClient(body);
    SharedPrefs.SaveDonneur(response.body);
    print(response.body);
  }
}
static void pushPostion()async{
  FlutterBackgroundLocation.getLocationUpdates((location) async {
    Map<String, dynamic> data = {
      'latitude':location.latitude,
      'longitude':location.longitude,
    };
    Map<String, dynamic> body = {
      'id': await SharedPrefs.GetUser(),
      'key':9,
      'value':data
    };
    Response response = await FirebaseApiService.create().UpdateClient(body);
    SharedPrefs.SaveDonneur(response.body);
    print(response.body);
  });

}
}