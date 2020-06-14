import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CourseFine {
  final String course;
  final String courseDescription;
  final double totalFines;

  CourseFine({this.course, this.courseDescription, this.totalFines});

  String getIndex(int index) {
    switch (index) {
      case 0:
        return course;
      case 1:
        return courseDescription;
      case 2:
        return _formatCurrency(totalFines);
    }
    return '';
  }
}

List<AttendanceWithObjEvent> _filterByCourse(
    String courseCode, List<AttendanceWithObjEvent> attendanceAll) {
  return attendanceAll
      .where((AttendanceWithObjEvent attendanceWithObjEvent) =>
          attendanceWithObjEvent.student.course.code.toUpperCase() ==
          courseCode)
      .toList();
}

CourseFine attendanceToCourseFine(List<AttendanceWithObjEvent> attendanceAll) {
  double totalFines = 0;
  for (AttendanceWithObjEvent a in attendanceAll) {
    if (a.eventDate.event.name.toUpperCase() == 'MASS' &&
        a.student.religion != 'Catholic') {
      totalFines = totalFines + 0;
    } else {
      totalFines = totalFines + a.eventDate.event.fines;
    }
  }

  return CourseFine(
      course: attendanceAll[0].student.course.code,
      courseDescription: attendanceAll[0].student.course.description,
      totalFines: totalFines);
}

double _totalFines(final List<CourseFine> courseFines) {
  double total = 0;
  for (CourseFine c in courseFines) {
    total = total + c.totalFines;
  }

  return total;
}

Future<Uint8List> generateFinesReport(PdfPageFormat pageFormat,
    List<AttendanceWithObjEvent> attendanceAll) async {
  List<AttendanceWithObjEvent> attendanceAllBSIT =
      _filterByCourse('BSIT', attendanceAll);
  List<AttendanceWithObjEvent> attendanceAllBEED =
      _filterByCourse('BEED', attendanceAll);
  List<AttendanceWithObjEvent> attendanceAllBSED =
      _filterByCourse('BSED', attendanceAll);
  List<AttendanceWithObjEvent> attendanceAllBSCRIM =
      _filterByCourse('BSCRIM', attendanceAll);
  List<AttendanceWithObjEvent> attendanceAllBSHM =
      _filterByCourse('BSHM', attendanceAll);

  List<CourseFine> fines = [];
  if (attendanceAllBSIT.length > 0) {
    fines.add(attendanceToCourseFine(attendanceAllBSIT));
  } else if (attendanceAllBEED.length > 0) {
    fines.add(attendanceToCourseFine(attendanceAllBEED));
  } else if (attendanceAllBSED.length > 0) {
    fines.add(attendanceToCourseFine(attendanceAllBSED));
  } else if (attendanceAllBSCRIM.length > 0) {
    fines.add(attendanceToCourseFine(attendanceAllBSCRIM));
  } else if (attendanceAllBSHM.length > 0) {
    fines.add(attendanceToCourseFine(attendanceAllBSHM));
  }

  final finesReport = FinesReport(
      baseColor: PdfColors.blue,
      accentColor: PdfColors.blueGrey900,
      courseFines: fines);
  return await finesReport.buildPdf(pageFormat);
}

class FinesReport {
  FinesReport({
    this.courseFines,
    this.baseColor,
    this.accentColor,
  });

  final List<CourseFine> courseFines;

  final PdfColor baseColor;
  final PdfColor accentColor;

  static const _darkColor = PdfColors.blueGrey800;
  static const _lightColor = PdfColors.white;

  PdfColor get _baseTextColor =>
      baseColor.luminance < 0.5 ? _lightColor : _darkColor;

  PdfColor get _accentTextColor =>
      baseColor.luminance < 0.5 ? _lightColor : _darkColor;

  // double get _total =>
  //     courseFines.map<double>((p) => p.total).reduce((a, b) => a + b);

  Future<Uint8List> buildPdf(PdfPageFormat pageFormat) async {
    // Create a PDF document.
    final doc = pw.Document();

    final font1 = await rootBundle.load('assets/fonts/roboto1.ttf');
    final font2 = await rootBundle.load('assets/fonts/roboto2.ttf');
    final font3 = await rootBundle.load('assets/fonts/roboto3.ttf');

    // Add page to the PDF
    doc.addPage(
      pw.MultiPage(
        pageTheme: _buildTheme(
          pageFormat,
          font1 != null ? pw.Font.ttf(font1) : null,
          font2 != null ? pw.Font.ttf(font2) : null,
          font3 != null ? pw.Font.ttf(font3) : null,
        ),
        build: (context) => [
          pw.SizedBox(height: 20),
          pw.Padding(
            padding: pw.EdgeInsets.all(16),
            child: _contentHeader(context),
          ),
          pw.Padding(
            padding: pw.EdgeInsets.all(16),
            child: _contentTable(context),
          ),
          pw.SizedBox(height: 20),
          pw.Padding(
            padding: pw.EdgeInsets.all(16),
            child: _contentFooter(context),
          ),
          pw.SizedBox(height: 20),
        ],
      ),
    );

    // Return the PDF file content
    return doc.save();
  }

  pw.PageTheme _buildTheme(
      PdfPageFormat pageFormat, pw.Font base, pw.Font bold, pw.Font italic) {
    return pw.PageTheme(
      pageFormat: pageFormat,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              top: pageFormat.marginTop + 72,
              left: 0,
              right: 0,
              child: pw.Container(
                height: 3,
                color: baseColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  pw.Widget _contentFooter(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.DefaultTextStyle(
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
          ),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Total:'),
              pw.Text(_formatCurrency(_totalFines(courseFines))),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _contentHeader(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(left: 10, right: 10),
                height: 70,
                child: pw.Text(
                  'Buenavista Community College',
                  style: pw.TextStyle(
                    color: _darkColor,
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _contentTable(pw.Context context) {
    const tableHeaders = ['Course', 'Course Description', 'Total'];

    return pw.Table.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: pw.BoxDecoration(
        borderRadius: 2,
        color: baseColor,
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
        color: _baseTextColor,
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
          color: accentColor,
          width: .5,
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: List<List<String>>.generate(
        courseFines.length,
        (row) => List<String>.generate(
          tableHeaders.length,
          (col) => courseFines[row].getIndex(col),
        ),
      ),
    );
  }
}

String _formatCurrency(double amount) {
  return '\PHP ${amount.toStringAsFixed(2)}';
}

String _formatDate(DateTime date) {
  final format = DateFormat.yMMMMd('en_US');
  return format.format(date);
}
