import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 8.0,),
            Expanded(
              flex: 2,
              child: RaisedButton(
                onPressed: () {
                  print("Button 1 press");
                },
                child: Text("Button 1"),
              ),
            ),
            SizedBox(width: 8.0,),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Button 1 press"),
                ),
              ),
            ),
            SizedBox(width: 8.0,),
          ],
        ),
        Container(
          child: RaisedButton(
            onPressed: () {
              print("Button 3 press");
            },
            child: Text("Button 3")
          ),
        )
      ],
    ));
  }
}
