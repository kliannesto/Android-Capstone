import 'package:flutter/material.dart';
import 'package:myapplication/widgets/smsscannerbody.dart';

class SmsScanner extends StatelessWidget {
  final String message;
  const SmsScanner({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Scanner"),
      ),
      body: SmsScannerBody(),
    );
  }
}