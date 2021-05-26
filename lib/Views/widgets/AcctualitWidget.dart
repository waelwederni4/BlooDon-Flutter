import 'package:bloodon/Controleurs/Data/News.dart';
import 'package:bloodon/Controleurs/utils/sizeConfig.dart';
import 'package:bloodon/Views/views/sliding_card.dart';
import 'package:bloodon/Views/widgets/AppointmentCard.dart';
import 'package:bloodon/Views/widgets/listWidget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bloodon/Controleurs/config/styles.dart';
class AcctualitWidget extends StatefulWidget {
  AcctualitWidget();
  @override
  AcctualitState createState() => AcctualitState();
}

class AcctualitState extends State<AcctualitWidget> {
  SlidingCardController controller;
  @override
  void initState() {
    super.initState();
    controller = SlidingCardController();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Acctualités',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),AppointmentCard(slidingCardController: controller)
        ],
      ),
    );
  }
}
