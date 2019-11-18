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
      body: SmsScannerBody(message: message,),
    );
  }
}



class SmsScannerBody extends StatefulWidget {
  String message;

  SmsScannerBody({Key key, this.message}) : super(key: key);

  _SmsScannerBodyState createState() => _SmsScannerBodyState(message: message);
}

class _SmsScannerBodyState extends State<SmsScannerBody> {
 String message;
  _SmsScannerBodyState({this.message});
  String _qroutput = " ";
  @override
  Widget build(BuildContext context) {
    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.camera,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "LOG-OUT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      );
    return Container(
      
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Align(alignment: Alignment.topCenter,
                child: Text(_qroutput,style: TextStyle(color: Colors.black87,fontSize: 20.0,fontWeight: FontWeight.bold),)),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(25.0)),
              height: 80.0,
              width: MediaQuery.of(context).size.width,

              
            ),
            
          ),
          
          
          
          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: <Widget>[
          //       Row(
          //         children: <Widget>[
          //           Expanded(
                      
          //             child: RaisedButton(
          //               // child: CircleAvatar( 
          //               //   radius: 30.0,
          //               // backgroundImage: AssetImage('assets/images/qr.png'),
                        
          //               // ),
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          //               onPressed: () async {
          //                 final _dio = Dio();
          //                 RestClient client = RestClient(_dio);
          //                 String qr =  await scanQR();
          //                 Student st = await client.getStudentById(int.parse(qr));
          //                 String msg="";
          //                 if(message == "Log-in"){
          //                   msg = "${st.fullname} is entering the campus";

          //                 }else {
          //                   msg = "${st.fullname} is exiting the campus";
          //                 }
          //                 SMS.sendMessage( msg , st.guardiancontact, context);
                          



          //               },
          //               child: Text(
          //                 "Capture QR",
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 20.0,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //               color: Colors.blueAccent,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
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
