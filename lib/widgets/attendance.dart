import 'package:flutter/material.dart';
import 'package:myapplication/widgets/menubox.dart';

class AttendanceMenu extends StatefulWidget {
  final MaterialPageRoute page;
  final String title;
  AttendanceMenu({Key key, this.page, this.title}) : super(key: key);

  _AttendanceMenuState createState() => _AttendanceMenuState();
}

class _AttendanceMenuState extends State<AttendanceMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Align(
                alignment: Alignment.topCenter,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.0)),
              height: 80.0,
              width: MediaQuery.of(context).size.width,
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return MenuBox();
                          }));
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
