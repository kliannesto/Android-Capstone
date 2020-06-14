import 'dart:io';

import 'package:myapplication/services/api_services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void printDocument(List<AttendanceWithObjEvent> atts) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text("Hello World"),
        ); // Center
      }));

  final file = File('$appDocPath/example.pdf');
  file.writeAsBytes(pdf.save());
}

pw.Widget _generateTable() {
  const tableHeaders = ['Course', 'Academic Year', 'Semester', 'Total fines'];

  const _darkColor = PdfColors.blueGrey800;
  const _lightColor = PdfColors.white;

  return pw.Table.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: pw.BoxDecoration(
        borderRadius: 2,
        color: _darkColor,
      ),
      headerHeight: 25,
      cellHeight: 40,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.center,
        4: pw.Alignment.centerRight,
      },
      headerStyle: pw.TextStyle(
        color: _darkColor,
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        color: _darkColor,
        fontSize: 10,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.BoxBorder(
          bottom: true,
          color: _darkColor,
          width: .5,
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: []
      // List<List<String>>.generate(
      //   products.length,
      //   (row) => List<String>.generate(
      //     tableHeaders.length,
      //     (col) => products[row].getIndex(col),
      //   ),
      // ),
      );
}
