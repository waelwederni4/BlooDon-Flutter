import 'package:bloodon/Models/notif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodon/Models/notif.dart';
import 'package:intl/intl.dart';

class NotisCard extends StatefulWidget {
   bool Selected = false;
   final Notif notification;

  NotisCard(this.notification);

  @override
  NotisCardState createState() => NotisCardState();
}

class NotisCardState extends State<NotisCard> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0, left: 10.0,right: 10.0),
    child:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
               Row(children: <Widget>[
                  Spacer(),
                  Icon(Icons.close_rounded),
                ]),
            Text(widget.notification.donation, style: TextStyle(color: Colors.black,fontSize: 18)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Text(
                        "${DateFormat('dd/MM/yyyy mm:ss').format(new DateTime.fromMicrosecondsSinceEpoch(widget.notification.time)).toString()}",style: TextStyle(color: Colors.grey),),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );

  }
  }
