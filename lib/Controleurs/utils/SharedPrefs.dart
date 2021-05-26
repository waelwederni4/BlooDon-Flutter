import 'dart:convert';

import 'package:bloodon/Models/Donneur.dart';
import 'package:bloodon/Models/notif.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static GetUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('id_user');
    return stringValue;
  }
  static SaveUser(User user)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("id_user",user.uid);
  }
  static GetDonneur()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("donnnnnnnnnnnnnnnnnnnnnnnneur :"+prefs.getString("donneur"));
    return json.decode(prefs.getString("donneur"));
  }
  static SaveDonneur(Map<String,dynamic> donneur)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("donneur",json.encode(donneur));
  }
  static FirstLogin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("first_login", true);
  }
  static setNotifications(Notif noti)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String notis=prefs.getString("list_notification");
    print("Notiss :"+notis.toString());
    List<Notif> list;
    if (notis!=null && notis.isNotEmpty)
     list=List<Notif>.from(json.decode(notis).map((x) => Notif.fromJson(x)));
    else
     list=new List<Notif>();

    list.add(noti);
    prefs.setString("list_notification", jsonEncode(list));
  }

  static Future<List<Notif>> getNotifications()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String notis=prefs.getString("list_notification");
    print("Notiss 4:"+notis);
    if (notis!=null && notis.isNotEmpty){
      List<Notif> notifs=List<Notif>.from(
          json.decode(notis).map((x) => Notif.fromJson(x)));
      print("Notiss 5:"+notifs.toString());
      return notifs;
    }else{
      return null;
    }
  }
}