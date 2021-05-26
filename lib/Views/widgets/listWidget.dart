import 'package:bloodon/Controleurs/Data/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget listWiget(News news){
  return Card(
    elevation: 2.0,
    margin: EdgeInsets.only(bottom: 20.0),
    child: Row(
      children: [
        Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:ExactAssetImage("assets/images/avatar.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        SizedBox(width: 5.0,),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(news.title,style: TextStyle(fontSize: 18.0),),SizedBox(height: 5.0),
            Row(
              children: [
                Icon(Icons.person),
                Text(news.body,style: TextStyle(fontSize: 12.0)),
                SizedBox(width: 10.0),
                Icon(Icons.date_range),
                Text(news.body,style: TextStyle(fontSize: 12.0))
              ],
            )
          ],
        )),
      ],
    ),
  );
}