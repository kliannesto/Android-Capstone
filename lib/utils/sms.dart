
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class SMS {
  static sendMessage(String msg, String contact, BuildContext context){

    SmsSender sender = SmsSender();
    SmsMessage message = SmsMessage(contact, msg);
    message.onStateChanged.listen((state){
      if (state == SmsMessageState.Sent){
        final snackBar = SnackBar(content: Text('Message Sucessfully Sent!'));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
      Scaffold.of(context).showSnackBar(snackBar);
        print(" Message sucessfully sent!");
      }

      if (state == SmsMessageState.Fail){
        print("Message Failed!");
      }
    });
    sender.sendSms(message);
  }
}