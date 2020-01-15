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
        title: Text("ID Scanner"),
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
          SizedBox(
            height: 128.0,
          ),
          Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
          iconSize: 100,
          icon: Icon(
            Icons.camera_alt,
            color: Colors.blue,
          ),
           onPressed: () async {
                          try {
                            final _dio = Dio();
                            RestClient client = RestClient(_dio);
                            if(_event!=null){
                            String qr = await scanQR();
                            print(_event);
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
                          }else{
                            final snackBar = SnackBar(
                                content: Text('Please Select an Event!'));
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                          } catch (e) {
                            print(e);
                                 final snackBar = SnackBar(
                                content: Text('Error occured!'));
                            Scaffold.of(context).showSnackBar(snackBar);
                            print(e.toString());
                          }
                        },

        ),
        SizedBox(
          height: 8,
        ),
        Text('Tap the Icon button above to scan an ID',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 15.0)),
      ]),
    )
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
