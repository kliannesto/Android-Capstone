import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapplication/provider/event_attendance.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatelessWidget {
  final Student student;
  const StudentPage({Key key, @required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students Info"),
      ),
      body: StudentDetail(
        student: student,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.monetization_on),
        onPressed: () async {
          context.read<EventAttendance>().calculate();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Fines"),
                  content:
                      Consumer<EventAttendance>(builder: (context, event, _) {
                    return Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Total Amount:",
                          ),
                          Expanded(
                              child: Text(
                            event.amount.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ))
                        ],
                      ),
                    );
                  }),
                );
              });
        },
      ),
    );
  }
}

class StudentDetail extends StatefulWidget {
  final Student student;
  StudentDetail({Key key, this.student}) : super(key: key);

  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  int _ay;
  int _sem;

  List<EventDate> _events = [];
  List<AttendanceWithObjEvent> attendances = [];
  List<Color> colors = [
    Colors.lightBlue,
    Colors.pink,
    Colors.purple,
    Colors.green,
    Colors.orangeAccent
  ];
  _StudentDetailState();

  StreamController<List<EventDate>> _eventstreamcontroller =
      StreamController<List<EventDate>>();

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
          Container(
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
                  hint: Text("Select Semester"),
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
                          child: Text(
                            "Find",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          onPressed: () async {
                            context.read<EventAttendance>().geteventDates(
                                _ay,
                                _sem,
                                widget.student.student_id,
                                widget.student.religion);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    child: Divider())
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: Consumer<EventAttendance>(
              builder: (context, event, _) {
                return ListView.builder(
                  itemCount: event.atts.length,
                  itemBuilder: (context, index) {
                    print(event.atts[index].isPresent);
                    return InkWell(
                      onTap: () {
                        //
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
                                  event.atts[index].eventDate.event.name != null
                                      ? event.atts[index].eventDate.event.name
                                          .substring(0, 1)
                                      : '',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    event.atts[index].eventDate.event.name !=
                                            null
                                        ? event.atts[index].eventDate.event.name
                                        : '',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                                Text(event.atts[index].eventDate.event.fines
                                    .toString())
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  event.atts[index].eventDate.eventdate != null
                                      ? Text(DateFormat("MM-dd-yyyy").format(
                                          event
                                              .atts[index].eventDate.eventdate))
                                      : Text(''),
                                  event.atts[index].isPresent != null &&
                                              event.atts[index].isPresent ||
                                          (event.atts[index].student.religion !=
                                                  'Catholic' &&
                                              event.atts[index].eventDate.event
                                                      .name ==
                                                  'Mass')
                                      ? Text('Present')
                                      : Text('absent')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
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
