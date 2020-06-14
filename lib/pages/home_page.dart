import 'package:flutter/material.dart';
import 'package:myapplication/pages/admin_portal_page.dart';
import 'package:myapplication/pages/entrance_attendance_portal.dart';
import 'package:myapplication/pages/ssg_attendance_portal_page.dart';
import 'package:myapplication/pages/student_query_fine_page.dart';
import 'package:myapplication/provider/event_attendance.dart';
import 'package:myapplication/widgets/menubox.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  Homepage({
    Key key,
  }) : super(key: key);

  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final isAdmin = context.select((EventAttendance e) => e.user.is_admin);
    return Scaffold(
      body: NestedScrollView(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: MenuBox(
                      onTap: () {
                        if (isAdmin) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SsgAttendancePortalPage(
                              tag: "tag1",
                              icon: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(100.0)),
                                child: CircleAvatar(
                                  radius: 100.0,
                                  backgroundImage:
                                      AssetImage('assets/images/notepad.png'),
                                ),
                              ),
                            );
                          }));
                        } else {
                          final snackBar =
                              SnackBar(content: Text('Admin access only!'));
                          Scaffold.of(context).showSnackBar(snackBar);
                        }
                      },
                      bgcolor: Colors.pinkAccent,
                      tag: "tag1",
                      icon: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(100.0)),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              AssetImage('assets/images/notepad.png'),
                        ),
                      ),
                      text: "SSG Event Attendance",
                    )),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: MenuBox(
                        onTap: () {
                          if (isAdmin) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return EntranceAttendancePortal(
                                  title: "Automated SMS Report",
                                  tag: "tag2",
                                  icon: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    child: CircleAvatar(
                                      radius: 100.0,
                                      backgroundImage: AssetImage(
                                          'assets/images/id-card.png'),
                                    ),
                                  ),
                                );
                              }),
                            );
                          } else {
                            final snackBar =
                                SnackBar(content: Text('Admin access only!'));
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                        },
                        bgcolor: Colors.purple,
                        tag: "tag2",
                        icon: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 3.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(100.0)),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                AssetImage('assets/images/id-card.png'),
                          ),
                        ),
                        text: "Automated SMS Report",
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
                        onTap: () {
                          if (isAdmin) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AdminPortalPage(
                                  title: "Admin Portal",
                                  tag: "tag3",
                                  icon: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(100.0)),
                                    child: CircleAvatar(
                                      radius: 100.0,
                                      backgroundImage:
                                          AssetImage('assets/images/admin.png'),
                                    ),
                                  ),
                                );
                              }),
                            );
                          } else {
                            final snackBar =
                                SnackBar(content: Text('Admin access only!'));
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                        },
                        bgcolor: Colors.lightBlue,
                        tag: "tag3",
                        icon: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 3.0, color: Colors.white),
                              borderRadius: BorderRadius.circular(100.0)),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                AssetImage('assets/images/admin.png'),
                          ),
                        ),
                        text: "Admin Portal",
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                        child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.lightBlue,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(25.0),
                        splashColor: Colors.yellowAccent,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return StudentQueryFinesPage();
                          }));
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(100.0)),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage('assets/images/student.png'),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "Student Portal",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0)),
                          height:
                              MediaQuery.of(context).size.height / 2 - 150.0,
                        ),
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Home"),
                centerTitle: true,
                background: Image.asset(
                  'assets/images/header.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ];
        },
      ),
    );
  }
}
