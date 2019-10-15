import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class SmsScannerBody extends StatefulWidget {
  SmsScannerBody({Key key}) : super(key: key);

  _SmsScannerBodyState createState() => _SmsScannerBodyState();
}

class _SmsScannerBodyState extends State<SmsScannerBody> {
  String _qroutput = "unknown";
  @override
  Widget build(BuildContext context) {
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {
                          scanQR();
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

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _qroutput = barcodeScanRes;
    });
  }

  @override
  void initState() {
    //scanQR();
    super.initState();
  }
}
