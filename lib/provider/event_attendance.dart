import 'package:flutter/foundation.dart';
import 'package:myapplication/services/api_services.dart';
import 'package:dio/dio.dart';

class EventAttendance with ChangeNotifier {
  
  List<EventDate> events=[];
  List<AttendanceWithObjEvent> atts =[];
  
  double amount= 0;
  final _dio = Dio();
  RestClient client;
  EventAttendance(){
       _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);

  }

  void clearEventsAndAttendance(){

    atts = [];
    events = [];

   notifyListeners();
  }
  
  void calculate() async {
    amount = 0;
    for(EventDate e in events)
    {
      
      if(!e.isPresent){
        print(e.event.fines);
        amount = amount + e.event.fines;
      }
    }
    notifyListeners();
  }

  void geteventDates(int ay, int sem, String stId) async{
    print(stId);
    atts = await client.getEventDatesByStudSemAndAY(sem, ay, stId);
    events = await  client.getEventDatesBySemAndAY(sem, ay);
    // print(atts);
    
    for(int i=0; i < events.length; i++){
 print(events[i].id);

     if(atts.where((e)=> e.eventDate.id == events[i].id).toList().length > 0 ) {
      events[i].isPresent = true;
      print('xd $i ${events[i].id}');
     } else {
       events[i].isPresent = false;
     }
    }

    for(int i=0; i < atts.length; i++) {
      print('A-${atts[i].eventDate.id} - $i');

    }

     notifyListeners();
  }


}