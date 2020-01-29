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
      //     child: Padding(
      //   padding: const EdgeInsets.all(24.0),
      //   child: Form(
      //     child: Row(
      //       children: <Widget>[
      //         Container(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Text('Type Your ID',
      //                   style:
      //                       TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      //               TextFormField(
      //                 keyboardType: TextInputType.number,
      //                 onSaved: (value) => _studentid = value,
      //               ),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           width: 8.0,
      //         ),
      //         Icon(
      //                             Icons.camera,
      //                             color: Colors.white,
      //                             size: 20.0,
      //                           ),
      //       ],
      //     ),
      //   ),
      // )
    ));
  }
}
