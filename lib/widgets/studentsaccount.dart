import 'package:flutter/material.dart';

class StudentAccount extends StatefulWidget {
  StudentAccount({Key key}) : super(key: key);

  @override
  _StudentAccountState createState() => _StudentAccountState();
}

class _StudentAccountState extends State<StudentAccount> {
  String _studentid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Account"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Center(
                  child: Icon(
                Icons.account_circle,
                size: 70,
                color: Colors.blueAccent,
              )),
              SizedBox(
                height: 20,
              ),
              Text('Type your ID',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              TextFormField(
                keyboardType: TextInputType.number,
                onSaved: (value) => _studentid = value,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.lightBlue,
                      child: Text(
                        "Search",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
