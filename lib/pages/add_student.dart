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
  String _studentid;
  String _fullname;
  String _address;
  String _mobileno;
  String _gcontact;
  int _course;

  final _dio = Dio();
  RestClient client;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    _dio.options.headers["Content-Type"] = "application/json";
    client = RestClient(_dio);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.blueAccent,
                )),
                SizedBox(
                  height: 20,
                ),
                Text('Student Id',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _studentid = value,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Fullname',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (value) => _fullname = value,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Address',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (value) => _address = value,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Mobile No.',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (value) => _mobileno = value,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Guardian Contact',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onSaved: (value) => _gcontact = value,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Course',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 16,
                ),
                FutureBuilder<List<Course>>(
                  future: client.getCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButtonFormField(
                        value: _course,
                        hint: Text("Select Course"),
                        decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(8.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                        items: snapshot.data
                            .map((course) => DropdownMenuItem<int>(
                                  child: Text(course.code),
                                  value: course.id,
                                ))
                            .toList(),
                        onChanged: (int value) {
                          setState(() {
                            _course = value;
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
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.lightBlue,
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () async {
                          _dio.options.headers["Content-Type"] =
                              "application/json";

                          client = RestClient(_dio);

                          _formKey.currentState.save();

                          print("Name:" + _fullname);

                          print("ID:" + _studentid.toString());

                          print("address" + _address);

                          print("Mobile" + _mobileno);

                          print("GContact" + _gcontact);

                          print("Course" + _course.toString());
                          if (_course != null &&
                              _fullname != null &&
                              _studentid != null &&
                              _gcontact != null &&
                              _address != null &&
                              _mobileno != null) {
                            Student student = Student(
                                fullname: _fullname,
                                student_id: _studentid,
                                address: _address,
                                mobileno: _mobileno,
                                guardiancontact: _gcontact,
                                course: _course,
                                isActive: true);

                            print('${student.course}');

                            print('${student.fullname}');

                            print('${student.student_id}');

                            print('${student.address}');

                            print('${student.mobileno}');

                            print('${student.guardiancontact}');

                            await client.addStudent(student);

                            Navigator.pop(context);
                          } else {
                            print("bcc");
                            final snackBar = SnackBar(
                                content: Text('Fill in all the fields!'));

                          // Find the Scaffold in the widget tree and use it to show a SnackBar.
                            _scaffoldKey.currentState.showSnackBar(snackBar);
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
