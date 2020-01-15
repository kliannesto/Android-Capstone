import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: "http://192.168.254.124:8000/api")
//flutter pub run build_runner build
abstract class RestClient{


factory RestClient(Dio dio) = _RestClient;

@GET('/students/studentbyId/{st_id}')
Future<Student> getStudentById(@Path('st_id') int st_id);

@GET('/students/')
Future<List<Student>> getStudents();

@POST('/students/')
Future<Student> addStudent(@Body() Student student);

@PUT('/students/{id}')
Future<Student> updateStudent(@Path('id') int id, @Body() Student student);

@GET('/students/{id}')
Future<Student> getStudent(@Path('id') int id);

@GET('/courses/')
Future<List<Course>> getCourses();

@POST('/attendance/')
Future<Attendance> saveAttendance(@Body() Attendance attendance);

@GET('/eventLists/')
Future<List<EventDate>> getEventDates();

@GET('/eventsnow/')
Future<List<EventDate>> getEventsNow();

@GET('/sy/')
Future<List<SY>> getAcademicYears();

@GET('/eventnames/')
Future<List<Event>> getEvents();

@POST('/events/')
Future<EventDateWithoutObject> addEventDate(@Body() EventDateWithoutObject eventdate);

@GET('/dateattendance/sem/{sem_id}/ay/{ay_id}')
Future<List<EventDate>> getEventDatesBySemAndAY(@Path('sem_id')int semId,@Path('ay_id')int AyId);

@GET('/dateattendance/sem/{sem_id}/ay/{ay_id}/stud/{st_id}')
Future<List<AttendanceWithObjEvent>> getEventDatesByStudSemAndAY(@Path('sem_id')int semId,@Path('ay_id')int AyId, @Path('st_id')String stId);
}





@JsonSerializable()
class Student{
  int id;
  String student_id;
  String fullname;
  String address;
  String mobileno;
  String guardiancontact;
  int course;
  bool isActive;

  Student({this.id,this.student_id,this.fullname,this.address,this.mobileno,this.guardiancontact,this.course,this.isActive});
factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
Map<String, dynamic> toJson() => _$StudentToJson(this);


}

@JsonSerializable()
class Course{
  int id;
  String code;
  String description;

  Course({this.id,this.code,this.description});
factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
Map<String, dynamic> toJson() => _$CourseToJson(this);

}

@JsonSerializable()
class Attendance{
  int id;
  int eventDate;
  int student;
  int logType;

  Attendance({this.id,this.eventDate,this.student,this.logType});
factory Attendance.fromJson(Map<String, dynamic> json) => _$AttendanceFromJson(json);
Map<String, dynamic> toJson() => _$AttendanceToJson(this);

}
@JsonSerializable()
class AttendanceWithObjEvent{
  int id;
  EventDate eventDate;
  int student;
  int logType;

  AttendanceWithObjEvent({this.id,this.eventDate,this.student,this.logType});
factory AttendanceWithObjEvent.fromJson(Map<String, dynamic> json) => _$AttendanceWithObjEventFromJson(json);
Map<String, dynamic> toJson() => _$AttendanceWithObjEventToJson(this);

}

@JsonSerializable()
class EventDate{
  int id;
  Event event;
  int sy;
  DateTime eventdate;
  bool isPresent;
  int logType;

  EventDate({this.id,this.event,this.sy,this.eventdate, this.isPresent,this.logType});
factory EventDate.fromJson(Map<String, dynamic> json) => _$EventDateFromJson(json);
Map<String, dynamic> toJson() => _$EventDateToJson(this);

}

@JsonSerializable()
class Event{
  int id;
  String name;
  int fines;


  Event({this.id,this.name,this.fines});
factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
Map<String, dynamic> toJson() => _$EventToJson(this);

}

@JsonSerializable()
class EventDateWithoutObject{
  int id;
  int event;
  int semester;
  int sy;
  String eventdate;
  bool isPresent;
  int logType;

  EventDateWithoutObject({this.id,this.event,this.sy,this.eventdate,this.semester,this.isPresent,this.logType});
factory EventDateWithoutObject.fromJson(Map<String, dynamic> json) => _$EventDateWithoutObjectFromJson(json);
Map<String, dynamic> toJson() => _$EventDateWithoutObjectToJson(this);

}




@JsonSerializable()
class SY{
  int id;
  String AY;

  SY({this.id,this.AY});
factory SY.fromJson(Map<String, dynamic> json) => _$SYFromJson(json);
Map<String, dynamic> toJson() => _$SYToJson(this);

}