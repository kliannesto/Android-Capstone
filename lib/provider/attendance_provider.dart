import 'package:flutter/foundation.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:dio/dio.dart';

class AttendanceProvider with ChangeNotifier {
  
  List<Attendance> attendances=[];
  
  final _dio = Dio();
  RestClient client;
  AttendanceProvider(){
       _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);

  }

  // void GetAttendanceByStudent(int ay, int sem, int student) async{
  //   attendances = await  client.getEventDatesBySemAndAY(sem, ay);
  //    notifyListeners();
  // }


}