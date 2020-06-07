import 'package:flutter/foundation.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:dio/dio.dart';

class EventAttendance with ChangeNotifier {
  List<AttendanceWithObjEvent> ssglogs = [];
  List<SMSLog> smslogs = [];
  List<EventDate> events = [];
  List<AttendanceWithObjEvent> atts = [];
  List<Student> students = [];

  User user;

  double amount = 0;
  final _dio = Dio();
  RestClient client;
  bool isAuthenticating = false;
  EventAttendance() {
    _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);
  }

  void getStudents() async {
    _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);
    students = await client.getStudents();
    notifyListeners();
  }

  void authenticate(bool isAuth) {
    isAuthenticating = isAuth;
    notifyListeners();
  }

  void clearEventsAndAttendance() {
    atts = [];
    events = [];

    notifyListeners();
  }

  void addUser(User userArg) {
    user = userArg;
    notifyListeners();
  }

  void calculate() async {
    amount = 0;
    for (AttendanceWithObjEvent e in atts) {
      if (!e.isPresent) {
        print("bhjjh");
        if (e.student.religion != 'Catholic' &&
            e.eventDate.event.name == 'Mass') {
          print("n sud");
          amount = amount + 0;
        } else {
          amount = amount + e.eventDate.event.fines;
        }
      }
    }
    notifyListeners();
  }

  void getLogs() async {
    smslogs = await client.getSMSLogs();
    notifyListeners();
  }

  void addLog(SMSLog smslog) async {
    await client.saveSMSLog(smslog);
    smslogs.add(smslog);
    notifyListeners();
  }

  void deleteSSGAttendanceLogs(int id) async {
    await client.deleteSSGAttendanceLogs(id);
    ssglogs.removeWhere((a) => a.id == id);
    notifyListeners();
  }

  void getSSGAttendanceLogs() async {
    ssglogs = await client.getSSGAttendanceLogs();
    notifyListeners();
  }

  void geteventDates(int ay, int sem, String stId, String religion) async {
    atts = await client.getEventDatesByStudSemAndAY(sem, ay, stId);
    notifyListeners();
  }
}
