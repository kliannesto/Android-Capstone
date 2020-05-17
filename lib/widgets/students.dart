import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapplication/pages/add_student.dart';
import 'package:myapplication/pages/studentsinfo.dart';
import 'package:myapplication/provider/event_attendance.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class StudentList extends StatefulWidget {
  StudentList({Key key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Student> students = [];
  List<Color> colors =[Colors.lightBlue, Colors.pink, Colors.purple,Colors.green, Colors.orangeAccent];
      final _dio = Dio();
    RestClient client;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getStudent();
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
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return AddStudent();
              }
            ));
          },
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: FutureBuilder<List<Student>>(
              future: client.getStudents(),
              builder:(context, snapshot){
                if (snapshot.hasData){
                  return  ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        
                            Provider.of<EventAttendance>(context).clearEventsAndAttendance();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context){
                            return StudentPage(student: snapshot.data[index]);
                          } ));
                      },
                                          child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 24.0,
                              backgroundColor: colors[Random().nextInt(colors.length)],
                              child: Text(snapshot.data[index].fullname.substring(0, 1),style: TextStyle(color: Colors.white)),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(snapshot.data[index].fullname, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),

                                Text(snapshot.data[index].address)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });

                }
                else if(snapshot.hasError){
                
                  return Center(
                    child:Container (
                      child: Text("An Error occured!"),
                    ),
                  );

                }
                 else {
                   print("!");
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
              }
                          
            )));
  }
}
