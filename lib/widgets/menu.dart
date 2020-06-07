import 'package:flutter/material.dart';
import 'package:myapplication/pages/admin_menu.dart';
import 'package:myapplication/pages/attendancemenu.dart';
import 'package:myapplication/pages/scaffoldmenu.dart';

import 'package:myapplication/widgets/studentsaccount.dart';

import '../provider/event_attendance.dart';
import 'menubox.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.select((EventAttendance e) => e.user.is_admin);
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
                    child: MenuBox(
                  onTap: () {
                    if (isAdmin) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AttendanceMenu(
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
                      backgroundImage: AssetImage('assets/images/notepad.png'),
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
                            return ScaffoldMenu(
                              title: "Automated SMS Report",
                              tag: "tag2",
                              icon: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(100.0)),
                                child: CircleAvatar(
                                  radius: 100.0,
                                  backgroundImage:
                                      AssetImage('assets/images/id-card.png'),
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
                          border: Border.all(width: 3.0, color: Colors.white),
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
                            return AdminMenu(
                              title: "Admin Portal",
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
                          border: Border.all(width: 3.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(100.0)),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/images/admin.png'),
                      ),
                    ),
                    text: "Admin Portal",
                  ),
                ),
                // Expanded(
                //     child: Material(
                //     elevation: 10.0,
                //     borderRadius: BorderRadius.circular(25.0),
                //     color: Colors.lightBlue,

                //     child: InkWell(
                //       borderRadius: BorderRadius.circular(25.0),
                //       splashColor: Colors.yellowAccent,

                //         onTap: (){
                //         Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context){
                //             return ScaffoldMenu(
                //               title: "Admin Portal",
                //         tag: "tag3",
                //         icon: Container(
                //           decoration: BoxDecoration(
                //               border: Border.all(color: Colors.white),
                //               borderRadius: BorderRadius.circular(100.0)),
                //           child: CircleAvatar(
                //             radius: 100.0,
                //             backgroundImage: AssetImage('assets/images/admin.png'),
                //           ),
                //         ),
                //             );
                //             //return StudentList();
                //           }
                //         ));
                //         },
                //       child: Container(

                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: <Widget>[
                //           Container(
                //           decoration: BoxDecoration(
                //               border: Border.all(color: Colors.white),
                //               borderRadius: BorderRadius.circular(100.0)),
                //           child: CircleAvatar(
                //             radius: 30.0,
                //             backgroundImage: AssetImage('assets/images/admin.png'),
                //           ),
                //         ),
                //               SizedBox(height: 8.0,),

                //               Text("Admin Portal",textAlign: TextAlign.center, style: TextStyle(
                //               fontSize: 13.0,
                //               color: Colors.white,
                //             ),)
                //             ],
                //           ),
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(25.0)),
                //         height: MediaQuery.of(context).size.height / 2 - 150.0,
                //       ),
                //     ),
                //   )
                //     ),
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
                        return StudentAccount();
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
                      height: MediaQuery.of(context).size.height / 2 - 150.0,
                    ),
                  ),
                )),
                // Expanded(
                //     child: MenuBox(
                //   bgcolor: Colors.blueAccent,
                //   tag: "tag4",
                //   icon: Container(
                //     decoration: BoxDecoration(
                //         border: Border.all(color: Colors.white),
                //         borderRadius: BorderRadius.circular(100.0)),
                //     child: CircleAvatar(
                //       radius: 30.0,
                //       backgroundImage: AssetImage('assets/images/student.png'),
                //     ),
                //   ),
                //   text: "Student Account",
                //   page: MaterialPageRoute(builder: (context) {
                //     return ScaffoldMenu(
                //       title: "Students Account",
                //       tag: "tag4",
                //       icon: Container(
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Colors.white, width: 3.0),
                //             borderRadius: BorderRadius.circular(100.0)),
                //         child: CircleAvatar(
                //           radius: 100.0,
                //           backgroundImage:
                //               AssetImage('assets/images/student.png'),
                //         ),
                //       ),
                //     );
                //   }),
                // )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
