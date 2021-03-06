import 'package:flutter/material.dart';

import 'entrance_attendance_log_page.dart';
import 'entrance_attendance_scanner_page.dart';

class EntranceAttendancePortal extends StatelessWidget {
  final String title;
  final Container icon;
  final String tag;
  const EntranceAttendancePortal({Key key, this.title, this.icon, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ID Scanner"),
      ),
      body: SingleChildScrollView(
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
                    Text(
                      title,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25.0),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return EntranceAttendanceScannerPage(
                              message: "Log-in",
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
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(25.0)),
                          padding: EdgeInsets.all(8.0),
                          height: 150.0,
                          width: MediaQuery.of(context).size.width / 2 - 4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25.0),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return EntranceAttendanceScannerPage(
                              message: "Log-out",
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
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(25.0)),
                          padding: EdgeInsets.all(8.0),
                          height: 150.0,
                          width: MediaQuery.of(context).size.width / 2 - 4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25.0),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return EntranceAttendanceLogPage();
                          }));
                        },
                        splashColor: Colors.yellowAccent,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.list,
                                color: Colors.white,
                                size: 50.0,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "SMS LOGS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(25.0)),
                          padding: EdgeInsets.all(8.0),
                          height: 150.0,
                          width: MediaQuery.of(context).size.width / 2 - 4,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
