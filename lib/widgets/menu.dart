import 'package:flutter/material.dart';
import 'package:myapplication/pages/attendancemenu.dart';
import 'package:myapplication/pages/scaffoldmenu.dart';
import 'package:myapplication/widgets/students.dart';
import 'package:myapplication/widgets/studentsaccount.dart';

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
                    child: MenuBox(
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
                  page: MaterialPageRoute(builder: (context) {
                    return AttendanceMenu(
                        tag: "tag1",
                        icon: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(100.0)),
                          child: CircleAvatar(
                            radius: 100.0,
                            backgroundImage: AssetImage('assets/images/notepad.png'),
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
                    bgcolor: Colors.purple,
                    tag: "tag2",
                    icon: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 3.0, color: Colors.white),
                          borderRadius: BorderRadius.circular(100.0)),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage('assets/images/id-card.png'),
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
                            backgroundImage: AssetImage('assets/images/id-card.png'),
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
                    child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.lightBlue,
                  
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      splashColor: Colors.yellowAccent,
              
                        onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context){
                            return StudentList();
                          }
                        ));
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
                            backgroundImage: AssetImage('assets/images/admin.png'),
                          ),
                        ),
                              SizedBox(height: 8.0,),
                              
                              Text("Admin",textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.white,
                            ),)
                            ],
                          ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0)),
                        height: MediaQuery.of(context).size.height / 2 - 150.0,
                      ),
                    ),
                  )
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
              
                        onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context){
                            return StudentsAccount();
                          }
                        ));
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
                            backgroundImage: AssetImage('assets/images/student.png'),
                          ),
                        ),
                              SizedBox(height: 8.0,),
                              
                              Text("Student Account",textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.white,
                            ),)
                            ],
                          ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0)),
                        height: MediaQuery.of(context).size.height / 2 - 150.0,
                      ),
                    ),
                  )
                    ),
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
