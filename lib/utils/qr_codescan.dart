import 'package:flutter/services.dart';
import 'package:qrscan/qrscan.dart' as scanner;

Future<String> scanQR() async {
  String barcodeScanRes;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    barcodeScanRes = await scanner.scan();
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }
  return barcodeScanRes;
}
