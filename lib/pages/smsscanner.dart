import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
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
        title: Text("SMS Scanner"),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
              children:[
                IconButton(
          iconSize: 80,
          icon: Icon(
            Icons.sms,
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
              msg = "${st.fullname} is entering the campus";
            } else {
              msg = "${st.fullname} is exiting the campus";
            }
            SMS.sendMessage(msg, st.guardiancontact, context);
          },
        ),
        SizedBox(height: 8,),
        Text('Tap the Icon butoon above to scan an ID')
              ] 
      ),
    );
  }

  @override
  void initState() {
    //scanQR();
    super.initState();
  }
}
