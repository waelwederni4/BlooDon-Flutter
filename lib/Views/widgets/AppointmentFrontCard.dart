import 'package:flutter/material.dart';
import 'package:bloodon/Controleurs/utils/sizeConfig.dart';

class AppointmentFrontCard extends StatefulWidget {
  final String address;
  final String name;
  final Function onInfoTapped;
  final Function onRedCloseButtonTapped;
  final Function onAccep;
  final Function onDecline;
  final String campagneDate;
  final String campagneTime;
  final String imgLink;
  const AppointmentFrontCard({
    Key key,
    @required this.imgLink,
    @required this.onAccep,
    @required this.onDecline,
    @required this.address,
    @required this.onInfoTapped,
    @required this.name,
    @required this.campagneDate,
    @required this.campagneTime,
    @required this.onRedCloseButtonTapped
  }) : super(key: key);
  @override
  _AppointmentFrontCardState createState() => _AppointmentFrontCardState();
}

class _AppointmentFrontCardState extends State<AppointmentFrontCard> {
  bool isinfoPressed = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xff2C8BFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.only(top: 0, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Campagne de Dons',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: SizeConfig.safeBlockHorizontal * 5,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.campagneDate + ', ' + widget.campagneTime,
                          style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 4.7,
                              color: Colors.white70),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal * 90,
                      //color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.7,
                                      color: Colors.black87),
                                ),
                                Text(
                                  widget.address,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.7,
                                      color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: (){
                                if(isinfoPressed == true)
                                {
                                  isinfoPressed = false;
                                  widget.onRedCloseButtonTapped();
                                  setState(() {});
                                }
                                else{
                                  isinfoPressed = true;
                                  widget.onInfoTapped();
                                  setState(() {});
                                }
                              },
                              child: Container(
                                //color: Colors.red,
                                child: isinfoPressed?Transform.rotate(
                                  angle: 0.7777,
                                  child: Icon(
                                    Icons.add_circle,
                                    size: SizeConfig.safeBlockHorizontal * 9,
                                    color: Colors.redAccent,
                                  ),
                                )
                                    :Icon(Icons.more_vert,color: Colors.blue,
                                    size: SizeConfig.safeBlockHorizontal * 7,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal * 90,
                        //color: Colors.indigo,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: SizeConfig.safeBlockVertical * 6,
                                child: RaisedButton(
                                  disabledElevation: 0,
                                  focusElevation: 0,
                                  highlightElevation: 0,
                                  hoverElevation: 7,
                                  elevation: 0.5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  onPressed: () {},
                                  child: Text(
                                    "S'abonner",
                                    style: TextStyle(
                                      fontSize:
                                      SizeConfig.safeBlockHorizontal * 5.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}