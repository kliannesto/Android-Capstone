import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapplication/pages/add_student_page.dart';
import 'package:myapplication/pages/student_fines_page.dart';
import 'package:myapplication/provider/event_attendance.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class StudentListPage extends StatefulWidget {
  StudentListPage({Key key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentListPage> {
  List<Student> students = [];
  List<Color> colors = [
    Colors.lightBlue,
    Colors.pink,
    Colors.purple,
    Colors.green,
    Colors.orangeAccent
  ];
  final _dio = Dio();
  RestClient client;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<EventAttendance>().getStudents();
  }

  getStudent() {
    final _dio = Dio();
    RestClient client = RestClient(_dio);
    setState(() {
      client.getStudents().then((res) {
        students = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    client = RestClient(_dio);
    return Scaffold(
        appBar: AppBar(
          title: Text("Students List"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddStudentPage();
            }));
          },
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Consumer<EventAttendance>(builder: (context, event, _) {
              if (event.students.length > 0) {
                return ListView.builder(
                    itemCount: event.students.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<EventAttendance>()
                              .clearEventsAndAttendance();
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return StudentFinePage(
                                student: event.students[index]);
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 24.0,
                                backgroundColor:
                                    colors[Random().nextInt(colors.length)],
                                child: Text(
                                    event.students[index].fullname
                                        .substring(0, 1),
                                    style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(event.students[index].fullname,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text(event.students[index].address)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else if (event.hasError) {
                return Center(
                  child: Container(
                    child: Text("An Error occured!"),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }
}
