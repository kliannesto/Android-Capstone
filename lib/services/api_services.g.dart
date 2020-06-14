// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    id: json['id'] as int,
    student_id: json['student_id'] as String,
    fullname: json['fullname'] as String,
    address: json['address'] as String,
    mobileno: json['mobileno'] as String,
    guardiancontact: json['guardiancontact'] as String,
    course: json['course'] as int,
    isActive: json['isActive'] as bool,
    religion: json['religion'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'student_id': instance.student_id,
      'fullname': instance.fullname,
      'address': instance.address,
      'mobileno': instance.mobileno,
      'guardiancontact': instance.guardiancontact,
      'course': instance.course,
      'isActive': instance.isActive,
      'religion': instance.religion,
    };

StudentRead _$StudentReadFromJson(Map<String, dynamic> json) {
  return StudentRead(
    id: json['id'] as int,
    student_id: json['student_id'] as String,
    fullname: json['fullname'] as String,
    address: json['address'] as String,
    mobileno: json['mobileno'] as String,
    guardiancontact: json['guardiancontact'] as String,
    course: json['course'] == null
        ? null
        : Course.fromJson(json['course'] as Map<String, dynamic>),
    isActive: json['isActive'] as bool,
    religion: json['religion'] as String,
  );
}

Map<String, dynamic> _$StudentReadToJson(StudentRead instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_id': instance.student_id,
      'fullname': instance.fullname,
      'address': instance.address,
      'mobileno': instance.mobileno,
      'guardiancontact': instance.guardiancontact,
      'course': instance.course,
      'isActive': instance.isActive,
      'religion': instance.religion,
    };

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    id: json['id'] as int,
    code: json['code'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'description': instance.description,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    username: json['username'] as String,
    is_admin: json['is_admin'] as bool,
    is_auth: json['is_auth'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'is_admin': instance.is_admin,
      'is_auth': instance.is_auth,
    };

Credential _$CredentialFromJson(Map<String, dynamic> json) {
  return Credential(
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$CredentialToJson(Credential instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return Attendance(
    id: json['id'] as int,
    eventDate: json['eventDate'] as int,
    student: json['student'] as int,
    logType: json['logType'] as int,
    isPresent: json['isPresent'] as bool,
  );
}

Map<String, dynamic> _$AttendanceToJson(Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventDate': instance.eventDate,
      'student': instance.student,
      'logType': instance.logType,
      'isPresent': instance.isPresent,
    };

AttendanceWithoutEventDate _$AttendanceWithoutEventDateFromJson(
    Map<String, dynamic> json) {
  return AttendanceWithoutEventDate(
    id: json['id'] as int,
    student: json['student'] as int,
    logType: json['logType'] as int,
    isPresent: json['isPresent'] as bool,
  );
}

Map<String, dynamic> _$AttendanceWithoutEventDateToJson(
        AttendanceWithoutEventDate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'logType': instance.logType,
      'isPresent': instance.isPresent,
    };

AttendanceWithObjEvent _$AttendanceWithObjEventFromJson(
    Map<String, dynamic> json) {
  return AttendanceWithObjEvent(
    id: json['id'] as int,
    eventDate: json['eventDate'] == null
        ? null
        : EventDate.fromJson(json['eventDate'] as Map<String, dynamic>),
    student: json['student'] == null
        ? null
        : StudentRead.fromJson(json['student'] as Map<String, dynamic>),
    logType: json['logType'] as int,
    isPresent: json['isPresent'] as bool,
  );
}

Map<String, dynamic> _$AttendanceWithObjEventToJson(
        AttendanceWithObjEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventDate': instance.eventDate,
      'student': instance.student,
      'logType': instance.logType,
      'isPresent': instance.isPresent,
    };

EventDate _$EventDateFromJson(Map<String, dynamic> json) {
  return EventDate(
    id: json['id'] as int,
    event: json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
    sy: json['sy'] as int,
    eventdate: json['eventdate'] == null
        ? null
        : DateTime.parse(json['eventdate'] as String),
    isPresent: json['isPresent'] as bool,
    logType: json['logType'] as int,
  );
}

Map<String, dynamic> _$EventDateToJson(EventDate instance) => <String, dynamic>{
      'id': instance.id,
      'event': instance.event,
      'sy': instance.sy,
      'eventdate': instance.eventdate?.toIso8601String(),
      'isPresent': instance.isPresent,
      'logType': instance.logType,
    };

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    id: json['id'] as int,
    name: json['name'] as String,
    fines: json['fines'] as int,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fines': instance.fines,
    };

EventDateWithoutObject _$EventDateWithoutObjectFromJson(
    Map<String, dynamic> json) {
  return EventDateWithoutObject(
    id: json['id'] as int,
    event: json['event'] as int,
    sy: json['sy'] as int,
    eventdate: json['eventdate'] as String,
    semester: json['semester'] as int,
    isPresent: json['isPresent'] as bool,
    logType: json['logType'] as int,
  );
}

Map<String, dynamic> _$EventDateWithoutObjectToJson(
        EventDateWithoutObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event': instance.event,
      'semester': instance.semester,
      'sy': instance.sy,
      'eventdate': instance.eventdate,
      'isPresent': instance.isPresent,
      'logType': instance.logType,
    };

EventDateWithAttendances _$EventDateWithAttendancesFromJson(
    Map<String, dynamic> json) {
  return EventDateWithAttendances(
    id: json['id'] as int,
    event: json['event'] as int,
    sy: json['sy'] as int,
    eventdate: json['eventdate'] as String,
    semester: json['semester'] as int,
    isPresent: json['isPresent'] as bool,
    logType: json['logType'] as int,
    attendances: (json['attendances'] as List)
        ?.map((e) => e == null
            ? null
            : AttendanceWithoutEventDate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EventDateWithAttendancesToJson(
        EventDateWithAttendances instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event': instance.event,
      'semester': instance.semester,
      'sy': instance.sy,
      'eventdate': instance.eventdate,
      'isPresent': instance.isPresent,
      'logType': instance.logType,
      'attendances': instance.attendances,
    };

SMSLog _$SMSLogFromJson(Map<String, dynamic> json) {
  return SMSLog(
    log: json['log'] as String,
    recipient: json['recipient'] as String,
  );
}

Map<String, dynamic> _$SMSLogToJson(SMSLog instance) => <String, dynamic>{
      'log': instance.log,
      'recipient': instance.recipient,
    };

SY _$SYFromJson(Map<String, dynamic> json) {
  return SY(
    id: json['id'] as int,
    AY: json['AY'] as String,
  );
}

Map<String, dynamic> _$SYToJson(SY instance) => <String, dynamic>{
      'id': instance.id,
      'AY': instance.AY,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://192.168.254.105:8000/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getStudentById(st_id) async {
    ArgumentError.checkNotNull(st_id, 'st_id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/students/studentbyId/$st_id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Student.fromJson(_result.data);
    return value;
  }

  @override
  getStudents() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/students/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Student.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  addStudent(student) async {
    ArgumentError.checkNotNull(student, 'student');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(student?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/students/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Student.fromJson(_result.data);
    return value;
  }

  @override
  updateStudent(id, student) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(student, 'student');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(student?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/students/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Student.fromJson(_result.data);
    return value;
  }

  @override
  getStudent(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/students/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Student.fromJson(_result.data);
    return value;
  }

  @override
  getCourses() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/courses/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Course.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  saveAttendance(attendance) async {
    ArgumentError.checkNotNull(attendance, 'attendance');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(attendance?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/attendance/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Attendance.fromJson(_result.data);
    return value;
  }

  @override
  saveSMSLog(smslog) async {
    ArgumentError.checkNotNull(smslog, 'smslog');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(smslog?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/smslogs/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SMSLog.fromJson(_result.data);
    return value;
  }

  @override
  getSMSLogs() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/smslogs/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => SMSLog.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getSSGAttendanceLogs() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        '/attendancelists',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            AttendanceWithObjEvent.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  deleteSSGAttendanceLogs(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('/attendance/$id/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  getEventDates() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/eventLists/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => EventDate.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getEventsNow() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/eventsnow/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => EventDate.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getAcademicYears() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/sy/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => SY.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getEvents() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/eventnames/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Event.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  addEventDate(eventdate) async {
    ArgumentError.checkNotNull(eventdate, 'eventdate');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(eventdate?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/events/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = EventDateWithAttendances.fromJson(_result.data);
    return value;
  }

  @override
  login(credential) async {
    ArgumentError.checkNotNull(credential, 'credential');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(credential?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request('/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = User.fromJson(_result.data);
    return value;
  }

  @override
  getEventDatesBySemAndAY(semId, AyId) async {
    ArgumentError.checkNotNull(semId, 'semId');
    ArgumentError.checkNotNull(AyId, 'AyId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        '/dateattendance/sem/$semId/ay/$AyId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => EventDate.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getEventDatesByStudSemAndAY(semId, ayId, stId) async {
    ArgumentError.checkNotNull(semId, 'semId');
    ArgumentError.checkNotNull(ayId, 'ayId');
    ArgumentError.checkNotNull(stId, 'stId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        '/dateattendance/sem/$semId/ay/$ayId/stud/$stId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            AttendanceWithObjEvent.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getEventBySemAndAY(semId, ayId) async {
    ArgumentError.checkNotNull(semId, 'semId');
    ArgumentError.checkNotNull(ayId, 'ayId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        '/dateattendance/sem/$semId/ay/$ayId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            AttendanceWithObjEvent.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  getEventDatesByCourseSemAndAY(semId, ayId, courseId) async {
    ArgumentError.checkNotNull(semId, 'semId');
    ArgumentError.checkNotNull(ayId, 'ayId');
    ArgumentError.checkNotNull(courseId, 'courseId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request(
        '/dateattendance/sem/$semId/ay/$ayId/course/$courseId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            AttendanceWithObjEvent.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
