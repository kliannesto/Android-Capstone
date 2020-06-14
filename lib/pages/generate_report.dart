import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapplication/provider/event_attendance.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:myapplication/utils/generate_document.dart';
import 'package:myapplication/utils/report.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:printing/printing.dart';

class GenerateReport extends StatelessWidget {
  const GenerateReport({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students Info"),
      ),
      body: ReportBody(),
    );
  }
}

class ReportBody extends StatefulWidget {
  ReportBody({
    Key key,
  }) : super(key: key);

  @override
  _ReportBodyState createState() => _ReportBodyState();
}

class _ReportBodyState extends State<ReportBody> {
  int _ay;
  int _sem;

  List<EventDate> _events = [];
  List<AttendanceWithObjEvent> attendances = [];
  List<Color> colors = [
    Colors.lightBlue,
    Colors.pink,
    Colors.purple,
    Colors.green,
    Colors.orangeAccent
  ];
  _ReportBodyState();

  StreamController<List<EventDate>> _eventstreamcontroller =
      StreamController<List<EventDate>>();

  List<Semester> _sems = [
    Semester(label: "First Sem", val: 0),
    Semester(label: "Second Sem", val: 1),
  ];
  final _dio = Dio();
  RestClient client;
  @override
  Widget build(BuildContext context) {
    // final actions = <PdfPreviewAction>[
    //   // PdfPreviewAction(
    //   //   icon: const Icon(Icons.save),
    //   //   onPressed: _saveAsFile,
    //   // )
    // ];

    _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          Container(
            child: Column(
              children: <Widget>[
                FutureBuilder<List<SY>>(
                  future: client.getAcademicYears(),
                  builder: (contex, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButtonFormField(
                        value: _ay,
                        hint: Text("Select Academic Year"),
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                        items: snapshot.data
                            .map((sy) => DropdownMenuItem<int>(
                                  child: Text(sy.AY),
                                  value: sy.id,
                                ))
                            .toList(),
                        onChanged: (int value) {
                          setState(() {
                            _ay = value;
                          });
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                DropdownButtonFormField(
                  value: _sem,
                  hint: Text("Select Semester"),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8.0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      )),
                  items: _sems
                      .map((sem) => DropdownMenuItem<int>(
                            child: Text(sem.label),
                            value: sem.val,
                          ))
                      .toList(),
                  onChanged: (int value) {
                    setState(() {
                      _sem = value;
                    });
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.blueAccent,
                          child: Text(
                            "Generate report",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          onPressed: () async {
                            context.read<EventAttendance>().getAllEventsBySemAy(
                                  _ay,
                                  _sem,
                                );
                            Printing.layoutPdf(
                              onLayout: (
                                PdfPageFormat pageFormat,
                              ) async {
                                return await generateFinesReport(
                                    pageFormat,
                                    context
                                        .read<EventAttendance>()
                                        .attendanceAll);
                              },
                            );

                            // printDocument(atts);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8),
                    child: Divider())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Semester {
  int val;
  String label;

  Semester({this.val, this.label});
}
