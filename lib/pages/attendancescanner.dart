import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:myapplication/utils/qr_codescan.dart';


class AttendanceScanner extends StatelessWidget {
  final String message;
  const AttendanceScanner({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Scanner"),
      ),
      body: AttendanceScannerBody(
        message: message,
      ),
    );
  }
}

class AttendanceScannerBody extends StatefulWidget {
  String message;

  AttendanceScannerBody({Key key, this.message}) : super(key: key);

  _AttendanceScannerBodyState createState() =>
      _AttendanceScannerBodyState(message: message);
}

class _AttendanceScannerBodyState extends State<AttendanceScannerBody> {
  String message;
  int _event;

  final _dio = Dio();
  RestClient client;

  _AttendanceScannerBodyState({this.message});
  String _qroutput = " ";
  @override
  Widget build(BuildContext context) {
    _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          FutureBuilder<List<EventDate>>(
            future: client.getEventDates(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButtonFormField(
                  value: _event,
                  hint: Text("Select Event"),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      )),
                  items: snapshot.data
                      .map((event) => DropdownMenuItem<int>(
                            child: Text('${DateFormat('MM-dd-yyyy').format(event.eventdate)}-${event.event.name}-${event.logType == 0 ? 'login':'logout'}') 
                                ,
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
          Expanded(
            child: Container(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    _qroutput,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.0)),
              height: 80.0,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        // child: CircleAvatar(
                        //   radius: 30.0,
                        // backgroundImage: AssetImage('assets/images/qr.png'),

                        // ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () async {
                          try {
                            final _dio = Dio();
                            RestClient client = RestClient(_dio);
                            String qr = await scanQR();
                            Student st =
                                await client.getStudentById(int.parse(qr));
                            Attendance at = Attendance(
                                eventDate: _event,
                                student: st.id,
                                logType: int.parse(message));
                            await client.saveAttendance(at);
                            final snackBar = SnackBar(
                                content: Text('Attendance successfully log!'));
                            Scaffold.of(context).showSnackBar(snackBar);
                          } catch (e) {
                                 final snackBar = SnackBar(
                                content: Text('Error occured!'));
                            Scaffold.of(context).showSnackBar(snackBar);
                            print(e.toString());
                          }
                        },
                        child: Text(
                          "Capture QR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    //scanQR();
    super.initState();
  }
}
