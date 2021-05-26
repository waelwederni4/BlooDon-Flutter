import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './hex_color.dart';

void showSnackbar(GlobalKey<ScaffoldState> _scaffoldKey, String text,
    {Color color}) {
  if (color == null) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        text,
        style: GoogleFonts.raleway(),
      ),
    ));
  } else {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        text,
        style: GoogleFonts.raleway(),
      ),
      backgroundColor: color,
    ));
  }
}

void showAlertSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String text,
    {Color color}) {
  if (color == null) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(text, style: GoogleFonts.raleway(color: Colors.white)),
      backgroundColor: HexColor(('#F22B29')),
    ));
  } else {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        text,
        style: GoogleFonts.raleway(),
      ),
      backgroundColor: color,
    ));
  }
}

String formatDate(DateTime dateTime) {
  String date;
  Duration difference = DateTime.now().difference(dateTime);

  if (difference.inMinutes < 1) {
    date = 'now';
  } else if (difference.inMinutes < 60) {
    date = difference.inMinutes.toString() + 'min ago';
  } else if (difference.inHours < 24) {
    date = difference.inHours.toString() + 'h ago';
  } else if (difference.inDays < 30) {
    date = difference.inDays.toString() + 'days ago';
  } else {
    date = dateTime.day.toString() +
        '/' +
        dateTime.month.toString() +
        '/' +
        dateTime.year.toString();
  }
  return date;
}

const currentUser = 'currentuser';
const currentPhoneNUmber = 'currentPhoneNumber';
const phoneNumber = 'phoneNumber';
const groups = 'groups';
const groupId = 'groupId';
const groupName = 'groupName';
const groupIconUrl = 'groupIconUrl';
const groupMembers = 'members';
const updateTime = 'updateTime';
const createdTime = 'createdTime';
const split = 'split';
const String evenly = 'evenly';
const String byOrder = 'byOrder';
const String paymentMode = 'paymentMode';
const String amount = 'amount';
const String cash = 'cash';
const String upi = 'upi';
const String to = 'to';
final TextStyle HINT_STYLE = TextStyle(color: Colors.grey[700]);
const String RS = "\u20B9";
const String FCM_TOKEN = 'fcm_token';
const DB_URL = 'https://us-central1-bloodon-2021.cloudfunctions.net/';
