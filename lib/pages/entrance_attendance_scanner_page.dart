import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:myapplication/utils/qr_codescan.dart';
import 'package:myapplication/utils/sms.dart';

class EntranceAttendanceScannerPage extends StatelessWidget {
  final String message;
  const EntranceAttendanceScannerPage({Key key, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ID Scanner"),
      ),
      body: _SmsScannerBody(
        message: message,
      ),
    );
  }
}

class _SmsScannerBody extends StatefulWidget {
  final String message;

  _SmsScannerBody({Key key, this.message}) : super(key: key);

  _SmsScannerBodyState createState() => _SmsScannerBodyState();
}

class _SmsScannerBodyState extends State<_SmsScannerBody> {
  _SmsScannerBodyState();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
          iconSize: 100,
          icon: Icon(
            Icons.camera_alt,
            color: Colors.blue,
          ),
          onPressed: () async {
            final _dio = Dio();
            RestClient client = RestClient(_dio);
            String qr = await scanQR();
            Student st = await client.getStudentById(qr);
            print(st);
            String msg = "";
            if (widget.message == "Log-in") {
              msg =
                  "${st.fullname} is entering in BCC campus on ${DateFormat("MM-dd-yyyy").format(DateTime.now())} ${DateFormat().add_jm().format(DateTime.now())}";
            } else {
              msg =
                  "${st.fullname} is leaving the BCC campus on ${DateFormat("MM-dd-yyyy").format(DateTime.now())} ${DateFormat().add_jm().format(DateTime.now())}";
            }
            SMS.sendMessage(msg, st.guardiancontact, context);
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
    );
  }

  @override
  void initState() {
    //scanQR();
    super.initState();
  }
}
