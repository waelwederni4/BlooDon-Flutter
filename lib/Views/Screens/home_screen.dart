import 'package:bloodon/Controleurs/utils/sizeConfig.dart';
import 'package:bloodon/Views/views/sliding_card.dart';
import 'package:bloodon/Views/widgets/AppointmentCard.dart';
import 'package:bloodon/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:bloodon/Controleurs/config/palette.dart';
import 'package:bloodon/Controleurs/config/styles.dart';
import 'package:bloodon/Controleurs/data/data.dart';
import 'package:bloodon/Views/widgets/widgets.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double circleRadius = 100.0;
  final double circleBorderWidth = 8.0;
  List<String> typesanguin = ["AB+", "AB-", "A+", "A-", "B+", "B-", "O+", "O-"];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color(0xFAFAFAFA),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.03),
              Text('Champions du dons',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                  child:Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                     Card(
                            margin: EdgeInsets.only(top: 10),
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              //replace this Container with your Card
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/gold.jpg"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              width: screenWidth,
                              height: 100.0,
                              child: Row(children: <Widget>[
                                Expanded(
                                    child: ListTile(
                                            leading:Container(
                                                width: 60.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: ExactAssetImage(
                                                        'assets/images/wael.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                            title: Text("Wael wederni",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                                            subtitle: Transform.translate(
                                                offset: Offset(90, 10),
                                                child:Text('1200 point',style: TextStyle(fontSize: 20),)))),
                              ]),
                            )),
                      Container(
                        transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                        width: circleRadius,
                        height: circleRadius,
                        child: Padding(
                          padding: EdgeInsets.only(right: circleBorderWidth),
                          child: Image.asset(
                            Assets.imagesFirst,
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                  child:Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                            child: Container(
                              //replace this Container with your Card
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/platinum.jpg"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              width: screenWidth,
                              height: 100,
                              child: Row(children: <Widget>[
                                Expanded(
                                    child: ListTile(
                                          leading:Image.asset(
                                            Assets.imagesAvatar,
                                            width: 60,
                                            height: 60,
                                          ) ,
                                            title: Text("Fatma Mdhafer",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                                            subtitle: Transform.translate(
                                                offset: Offset(90, 10),
                                                child:Text('900 point',style: TextStyle(fontSize: 20),)))),
                              ]),
                            )),
                      Container(
                        transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                        width: circleRadius,
                        height: circleRadius,
                        child: Padding(
                          padding: EdgeInsets.only(right: circleBorderWidth),
                          child: Image.asset(
                            Assets.imagesSecond,
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                  padding: const EdgeInsets.only(left:8.0,right: 8.0),
                  child:Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              //replace this Container with your Card
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/silver.png"),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              height: 100.0,
                              child: Row(children: <Widget>[
                                Expanded(
                                    child:ListTile(
                                            leading:Image.asset(
                                              Assets.imagesAvatar,
                                              width: 60,
                                              height: 60,
                                            ) ,
                                            title: Text("Eya Makdouli",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                                            subtitle:Transform.translate(
                                                offset: Offset(90, 10),
                                                child:  Text('700 point',style: TextStyle(fontSize: 20),)))),
                              ]),
                            )),
                      Container(
                        transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                        width: circleRadius,
                        height: circleRadius,
                        child: Padding(
                          padding: EdgeInsets.only(right: circleBorderWidth),
                          child: Image.asset(
                            Assets.imagesThird,
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: screenHeight * 0.01),
              Text('Our Users',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 200.0,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(15),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  children: <Widget>[
                    Center(
                        child: Card(
                            color: Color(0xFF8D1616),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    typesanguin[0],
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Text('100',
                                      style: TextStyle(color: Colors.white))
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ))),
                    Center(
                        child: Card(
                            color: Color(0xFF8D1616),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    typesanguin[1],
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Text('80',
                                      style: TextStyle(color: Colors.white))
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ))),
                    Center(
                        child: Card(
                            color: Color(0xFF8D1616),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    typesanguin[2],
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Text('25',
                                      style: TextStyle(color: Colors.white))
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ))),
                    Center(
                        child: Card(
                            color: Color(0xFF8D1616),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    typesanguin[3],
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Text('20',
                                      style: TextStyle(color: Colors.white))
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ))),
                    Center(
                        child: Card(
                            color: Color(0xFF8D1616),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    typesanguin[4],
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Text('10',
                                      style: TextStyle(color: Colors.white))
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ))),
                    Center(
                        child: Card(
                            color: Color(0xFF8D1616),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    typesanguin[5],
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Text('0',
                                      style: TextStyle(color: Colors.white))
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ))),
                    Center(
                        child: Card(
                            color: Color(0xFF8D1616),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    typesanguin[6],
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Text('40',
                                      style: TextStyle(color: Colors.white))
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ))),
                    Center(
                        child: Card(
                            color: Color(0xFF8D1616),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150),
                            ),
                            child: ListTile(
                              title: Row(
                                children: <Widget>[
                                  Text(
                                    typesanguin[7],
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              subtitle: Row(
                                children: <Widget>[
                                  Text('70',
                                      style: TextStyle(color: Colors.white))
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            )))
                  ],
                ),
              ),
              AcctualitWidget(),
            ],
          ),
        ));
  }
//
/*SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: ,
        ),
      ),
    );
  }*/
}
