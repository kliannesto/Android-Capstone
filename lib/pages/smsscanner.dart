import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:myapplication/utils/qr_codescan.dart';
import 'package:myapplication/utils/sms.dart';

class SmsScanner extends StatelessWidget {
  final String message;
  const SmsScanner({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ID Scanner"),
      ),
      body: SmsScannerBody(
        message: message,
      ),
    );
  }
}

class SmsScannerBody extends StatefulWidget {
  String message;

  SmsScannerBody({Key key, this.message}) : super(key: key);

  _SmsScannerBodyState createState() => _SmsScannerBodyState();
}

class _SmsScannerBodyState extends State<SmsScannerBody> {
  _SmsScannerBodyState();
  String _qroutput = " ";
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
            Student st = await client.getStudentById(int.parse(qr));
            print(st);
            String msg = "";
            if (widget.message == "Log-in") {
              msg = "${st.fullname} is entering in BCC campus";
            } else {
              msg = "${st.fullname} is leaving the BCC campus";
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
