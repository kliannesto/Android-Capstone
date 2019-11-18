import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:myapplication/services/api_services.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key key}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();
  int _studentid;
  String _fullname;
  String _address;
  String _mobileno;
  String _gcontact;
  int _course;

  final _dio = Dio();
    RestClient client;

  @override
  Widget build(BuildContext context) {
          _dio.options.headers["Content-Type"]=
                     "application/json";
    client = RestClient(_dio);
    return Scaffold(
       appBar: AppBar(
         title: Text("Add Student"),
       ),
       body: SingleChildScrollView(
                child: Card(
           child: Form(
             key: _formKey,
                      child: Column(
               children: <Widget>[

                 TextFormField(
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     isDense: true,
                     labelText: "Enter Student ID",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(25.0)
                     ),
                   ),
                   onSaved: (value) => _studentid = int.parse(value),
                 ),

                SizedBox(height: 8.0,),

                 TextFormField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     isDense: true,
                     labelText: "Enter FullName",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(25.0)
                     ),
                   ),
                   onSaved: (value) => _fullname = value,
                 ),

                SizedBox(height: 8.0,),

                 TextFormField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     isDense: true,
                     labelText: "Enter Address",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(25.0)
                     ),
                   ),
                   onSaved: (value) => _address = value,
                 ),
                 SizedBox(height: 8.0,),

                 TextFormField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     isDense: true,
                     labelText: "Enter Mobile No.",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(25.0)
                     ),
                   ),
                   onSaved: (value) => _mobileno = value,
                 ),

                 SizedBox(height: 8.0,),

                 TextFormField(
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     isDense: true,
                     labelText: "Enter Guardian Contact.",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(25.0)
                     ),
                   ),
                   onSaved: (value) => _gcontact = value,
                   
                 ),
                
                 SizedBox(height: 8.0,),

                 FutureBuilder<List<Course>>(
                   future: client.getCourses(),
                   builder: (context, snapshot){
                     if (snapshot.hasData){
                       return DropdownButtonFormField(
                         value: _course,
                         hint: Text("Select Course"),
                         decoration: InputDecoration(
                           isDense: true,
                           contentPadding: EdgeInsets.all(8.0),
                           enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: Colors.white),
                           )
                         ),
                         items: snapshot.data
                         .map(
                          (course) => DropdownMenuItem<int>(
                            child: Text(course.code),
                            value: course.id,
                          )
                          
                         ).toList(),
                         onChanged: (int value){
                           setState(() {
                             _course = value;
                           });
                         },

                       );
                     }else {
                       return Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                   },
                 ),
                 RaisedButton(
                   child: Text("Save"),
                   onPressed: () async{
                     _dio.options.headers["Content-Type"]=
                     "application/json";
    client = RestClient(_dio);

                     _formKey.currentState.save();
                     print("Name:"+_fullname);
                     print("ID:"+_studentid.toString());
                     print("address"+_address);
                     print("Mobile"+_mobileno);
                     print("GContact"+_gcontact);
                     print("Course"+_course.toString());
                     Student student = Student(fullname: _fullname, student_id: _studentid, address: _address,
                     mobileno: _mobileno,guardiancontact: _gcontact, course: _course,isActive:true);

                    
                      
                      print('${student.course}');
                      print('${student.fullname}');
                      print('${student.student_id}');
                      print('${student.address}');
                      print('${student.mobileno}');
                      print('${student.guardiancontact}');

                      await client.addStudent(student);
                      Navigator.pop(context);
                      
                   } ,
                 )
               ],
             ),
           ),
         ),
       ),
    );
  }
}