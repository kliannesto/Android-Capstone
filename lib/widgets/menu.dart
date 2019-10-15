import 'package:flutter/material.dart';
import 'package:myapplication/pages/scaffoldmenu.dart';
import 'package:myapplication/widgets/attendance.dart';

import 'menubox.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    width: MediaQuery.of(context).size.width,
              height: 200.0,
              color: Colors.purpleAccent,
                  ),),
              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                    child: MenuBox(
                  bgcolor: Colors.pinkAccent,
                  tag: "tag1",
                  icon: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.0)),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/images/att4.png'),
                    ),
                  ),
                  text: "SSG Event Attendance",
                  page: MaterialPageRoute(builder: (context) {
                    return AttendanceMenu(
                      title: "SSG Event Attendance",
                    );
                  }),
                )),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: MenuBox(
                    bgcolor: Colors.purple,
                    tag: "tag2",
                    icon: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 3.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(100.0)),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/images/id.png'),
                      ),
                    ),
                    text: "Automated ID System",
                    page: MaterialPageRoute(builder: (context) {
                      return ScaffoldMenu(
                        title: "Automated ID System",
                        tag: "tag2",
                        icon: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(100.0)),
                          child: CircleAvatar(
                            radius: 100.0,
                            backgroundImage: AssetImage('assets/images/id.png'),
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: MenuBox(
                  bgcolor: Colors.lightBlue,
                  tag: "tag3",
                  icon: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.0)),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/images/admin.png'),
                    ),
                  ),
                  text: "Admin",
                  page: MaterialPageRoute(builder: (context) {
                    return ScaffoldMenu(
                      title: "Admin",
                      tag: "tag3",
                      icon: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(100.0)),
                        child: CircleAvatar(
                          radius: 100.0,
                          backgroundImage:
                              AssetImage('assets/images/admin.png'),
                        ),
                      ),
                    );
                  }),
                )),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                    child: MenuBox(
                  bgcolor: Colors.blueAccent,
                  tag: "tag4",
                  icon: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(100.0)),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('assets/images/student.png'),
                    ),
                  ),
                  text: "Student Account",
                  page: MaterialPageRoute(builder: (context) {
                    return ScaffoldMenu(
                      title: "Students Account",
                      tag: "tag4",
                      icon: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3.0),
                            borderRadius: BorderRadius.circular(100.0)),
                        child: CircleAvatar(
                          radius: 100.0,
                          backgroundImage:
                              AssetImage('assets/images/student.png'),
                        ),
                      ),
                    );
                  }),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
