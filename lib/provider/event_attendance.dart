import 'package:flutter/foundation.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:dio/dio.dart';

class EventAttendance with ChangeNotifier {
  
  List<EventDate> events=[EventDate(event: Event(name: "bladasd", fines: 30.0))];
  
  final _dio = Dio();
  RestClient client;
  EventAttendance(){
       _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);

  }

  void GeteventDates(int ay, int sem) async{
    events = await  client.getEventDatesBySemAndAY(sem, ay);
     notifyListeners();
  }


}