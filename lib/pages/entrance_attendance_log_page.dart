import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/event_attendance.dart';
import '../services/api_services.dart';

class EntranceAttendanceLogPage extends StatefulWidget {
  EntranceAttendanceLogPage({Key key}) : super(key: key);

  @override
  _LogsPageState createState() => _LogsPageState();
}

class _LogsPageState extends State<EntranceAttendanceLogPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<EventAttendance>().getLogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Logs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<EventAttendance>(
          builder: (context, event, _) {
            return ListView.builder(
              itemCount: event.smslogs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _logItem(event.smslogs[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _logItem(SMSLog smsLog) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            smsLog.log,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            smsLog.recipient,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
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
