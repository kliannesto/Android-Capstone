import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapplication/provider/event_attendance.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatelessWidget {
  final int id;
  const StudentPage({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students Info"),
      ),
      body: StudentDetail(
        stid: id,
      ),
    );
  }
}

class StudentDetail extends StatefulWidget {
  final int stid;
  StudentDetail({Key key, this.stid}) : super(key: key);

  @override
  _StudentDetailState createState() => _StudentDetailState(stid: stid);
}

class _StudentDetailState extends State<StudentDetail> {
  int _ay;
  int _sem;
  final int stid;

  List<EventDate> _events=[];

  _StudentDetailState({this.stid});
  
  StreamController<List<EventDate>> _eventstreamcontroller = StreamController<List<EventDate>>();

  List<Semester> _sems = [
    Semester(label: "First Sem", val: 0),
    Semester(label: "Second Sem", val: 1),
  ];
  final _dio = Dio();
  RestClient client;
  @override
  Widget build(BuildContext context) {
    _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          Material(
            borderRadius: BorderRadius.circular(18),
            elevation: 8.0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: <Widget>[
                  FutureBuilder<List<SY>>(
                    future: client.getAcademicYears(),
                    builder: (contex, snapshot) {
                      if (snapshot.hasData) {
                        return DropdownButtonFormField(
                          value: _ay,
                          hint: Text("Select Academic Year"),
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8.0),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              )),
                          items: snapshot.data
                              .map((sy) => DropdownMenuItem<int>(
                                    child: Text(sy.AY),
                                    value: sy.id,
                                  ))
                              .toList(),
                          onChanged: (int value) {
                            setState(() {
                              _ay = value;
                            });
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  DropdownButtonFormField(
                    value: _sem,
                    hint: Text("Select Academic Year"),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(8.0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                    items: _sems
                        .map((sem) => DropdownMenuItem<int>(
                              child: Text(sem.label),
                              value: sem.val,
                            ))
                        .toList(),
                    onChanged: (int value) {
                      setState(() {
                        _sem = value;
                      });
                    },
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: RaisedButton(
                            color: Colors.blueAccent,
                            child: Text("Find", style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),),
                            onPressed: () async {
                              
                              Provider.of<EventAttendance>(context).GeteventDates(_ay, _sem);
                              
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            
          ),
          SizedBox(
            height: 8.0,
          ),

          
Expanded(
  child:   Consumer<EventAttendance>(
  
    builder: (context, event, _){
  
      return ListView.builder(
  
        
  
        itemCount: event.events.length,
  
        itemBuilder: (context, index){
  
  
  
          return Text(event.events[index].event.name);
  
        },
  
  
  
      );
  
    },
  
  ),
)
          
        ],
      ),
    );
  }
}

class Semester {
  int val;
  String label;

  Semester({this.val, this.label});
}
