import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:myapplication/provider/event_attendance.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:provider/provider.dart';

class SSGAttendanceLogs extends StatefulWidget {
  SSGAttendanceLogs({Key key}) : super(key: key);

  @override
  _SSGAttendanceLogsState createState() => _SSGAttendanceLogsState();
}

class _SSGAttendanceLogsState extends State<SSGAttendanceLogs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<EventAttendance>().getSSGAttendanceLogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SSG Attendance Logs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<EventAttendance>(
          builder: (context, event, _) {
            return ListView.builder(
              itemCount: event.ssglogs.length,
              itemBuilder: (context, index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: 'Archive',
                      color: Colors.blue,
                      icon: Icons.archive,
                      onTap: () => Provider.of<EventAttendance>(context)
                          .deleteSSGAttendanceLogs(event.ssglogs[index].id),
                    ),
                  ],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _logItem(event.ssglogs[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _logItem(AttendanceWithObjEvent ssgattendanceLog) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  ssgattendanceLog.student.fullname,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  ssgattendanceLog.eventDate.event.name,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Text(
            '${DateFormat("MM-dd-yyyy").format(ssgattendanceLog.eventDate.eventdate)} \n ${ssgattendanceLog.logType == 0 ? 'login' : 'logout'}',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: 8.0),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
              colors: <Color>[
                Colors.blue,
                Colors.greenAccent,
              ],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 0),
              stops: [0, 1],
              tileMode: TileMode.clamp)),
    );
  }
}
