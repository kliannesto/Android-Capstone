import 'package:flutter/material.dart';
import 'package:myapplication/pages/smsscanner.dart';

import 'attendancescanner.dart';

class AttendanceMenu extends StatelessWidget {
  final String menu;
  final Container icon;
  final String tag;
  const AttendanceMenu({Key key, this.menu, this.icon, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                      colors: <Color>[
                        Colors.blue,
                        Colors.greenAccent,
                      ],
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(1, 0),
                      stops: [0, 1],
                      tileMode: TileMode.clamp)),


              child: Column(
                children: <Widget>[
                  Hero(
                    tag: tag,
                    child: CircleAvatar(
                      child: icon,
                      radius: 70.0,
                    ),
                  ),
                  
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(25.0),
                  elevation: 10.0,
                  color: Colors.purpleAccent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AttendanceScanner(
                          message: "0",
                        );
                      }));
                    },
                    splashColor: Colors.yellowAccent,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.camera,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "LOG-IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(

                          gradient: LinearGradient(
                              colors: <Color>[
                                Colors.purple,
                                Colors.pinkAccent,
                              ],
                              begin: FractionalOffset(0, 0),
                              end: FractionalOffset(1, 0),
                              stops: [0, 1],
                              tileMode: TileMode.clamp),


                          border:
                              Border.all(color: Colors.pinkAccent, width: 5.0),
                          borderRadius: BorderRadius.circular(25.0)),
                      padding: EdgeInsets.all(8.0),
                      height: 200.0,
                      width: MediaQuery.of(context).size.width / 2 - 4,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Material(
                  borderRadius: BorderRadius.circular(25.0),
                  elevation: 10.0,
                  color: Colors.purpleAccent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AttendanceScanner(
                          message: "1",
                        );
                      }));
                    },
                    splashColor: Colors.yellowAccent,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.camera,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "LOG-OUT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(

                          gradient: LinearGradient(
                              colors: <Color>[
                                Colors.yellow,
                                Colors.green,
                              ],
                              begin: FractionalOffset(0, 0),
                              end: FractionalOffset(1, 0),
                              stops: [0, 1],
                              tileMode: TileMode.clamp),


                          border:
                              Border.all(color: Colors.greenAccent, width: 5.0),
                          borderRadius: BorderRadius.circular(25.0)),
                      padding: EdgeInsets.all(8.0),
                      height: 200.0,
                      width: MediaQuery.of(context).size.width / 2 - 4,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HomeAttendance extends StatefulWidget {
  HomeAttendance({Key key}) : super(key: key);

  _HomeAttendanceState createState() => _HomeAttendanceState();
}

class _HomeAttendanceState extends State<HomeAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        body: AttendanceMenu(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("MENU"),
                centerTitle: true,
              ),
            )
          ];
        },
      ),
    );
  }
}
