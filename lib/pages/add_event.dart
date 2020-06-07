import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:myapplication/model/log_type.dart';
import 'package:myapplication/pages/studentsinfo.dart';
import 'package:myapplication/provider/event_attendance.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  AddEvent({Key key}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();
  int _event;
  int _semester;
  DateTime _eventdate;
  int _sy;
  int _logType;

  final _dio = Dio();
  RestClient client;

  List<Semester> _sems = [
    Semester(label: "first semester", val: 0),
    Semester(label: "second semester", val: 1)
  ];
  List<LogType> _logTypes = [
    LogType(label: "log in", val: 0),
    LogType(label: "log out", val: 1)
  ];

  final format = DateFormat("yyyy-MM-dd");

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<EventAttendance>().getStudents();
  }

  @override
  Widget build(BuildContext context) {
    _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Add Event"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Icon(
                  Icons.event,
                  size: 80,
                  color: Colors.blueAccent,
                )),
                SizedBox(
                  height: 20,
                ),
                Text('Event',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 16.0,
                ),
                FutureBuilder<List<Event>>(
                  future: client.getEvents(),
                  builder: (contex, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButtonFormField(
                        value: _event,
                        hint: Text("Select Events"),
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                        items: snapshot.data
                            .map((event) => DropdownMenuItem<int>(
                                  child: Text(event.name),
                                  value: event.id,
                                ))
                            .toList(),
                        onChanged: (int value) {
                          setState(() {
                            _event = value;
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
                Text(
                  'Date',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                DateTimeField(
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                  onSaved: (date) {
                    _eventdate = date;
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Sem',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 16.0,
                ),
                DropdownButtonFormField<int>(
                  value: _semester,
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
                      _semester = value;
                    });
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Log Type',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 16.0,
                ),
                DropdownButtonFormField<int>(
                  value: _logType,
                  hint: Text("Select Logging Type"),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      )),
                  items: _logTypes
                      .map((log) => DropdownMenuItem<int>(
                            child: Text(log.label),
                            value: log.val,
                          ))
                      .toList(),
                  onChanged: (int value) {
                    setState(() {
                      _logType = value;
                    });
                  },
                ),
                Text('SY',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 16.0,
                ),
                FutureBuilder<List<SY>>(
                  future: client.getAcademicYears(),
                  builder: (contex, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButtonFormField(
                        value: _sy,
                        hint: Text("Select School Year"),
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
                            _sy = value;
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
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Consumer<EventAttendance>(
                        builder: (context, provider, _) {
                          return RaisedButton(
                            color: Colors.lightBlue,
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0)),
                            onPressed: () async {
                              print("ne sud");
                              _dio.options.headers["Content-Type"] =
                                  "application/json";

                              client = RestClient(_dio);

                              _formKey.currentState.save();

                              if (_event != null &&
                                  _semester != null &&
                                  _sy != null &&
                                  _eventdate != null &&
                                  _logType != null) {
                                EventDateWithAttendances eventdate =
                                    EventDateWithAttendances(
                                  event: _event,
                                  semester: _semester,
                                  sy: _sy,
                                  eventdate: DateFormat('yyyy-MM-dd')
                                      .format(_eventdate),
                                  logType: _logType,
                                  attendances: provider.students
                                      .map((student) =>
                                          AttendanceWithoutEventDate(
                                              student: student.id,
                                              logType: _logType,
                                              isPresent: false))
                                      .toList(),
                                );

                                // Student student = Student(
                                //     fullname: _fullname,
                                //     student_id: _studentid,
                                //     address: _address,
                                //     mobileno: _mobileno,
                                //     guardiancontact: _gcontact,
                                //     course: _course,
                                //     isActive: true);

                                // print('${student.course}');

                                // print('${student.fullname}');

                                // print('${student.student_id}');

                                // print('${student.address}');

                                // print('${student.mobileno}');

                                // print('${student.guardiancontact}');

                                await client.addEventDate(eventdate);

                                Navigator.pop(context);
                              } else {
                                print("kgjhgjg");
                                final snackBar = SnackBar(
                                    content: Text('Fill in all the fields!'));

                                // Find the Scaffold in the widget tree and use it to show a SnackBar.
                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
