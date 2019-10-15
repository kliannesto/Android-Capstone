import 'package:flutter/material.dart';
import 'package:myapplication/pages/smsscanner.dart';

class SmsMenuBody extends StatelessWidget {
  final String menu;
  final Container icon;
  final String tag;
  const SmsMenuBody({Key key, this.menu, this.icon, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              padding: EdgeInsets.all(8.0),
              color: Colors.pinkAccent,
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: tag,
                    child: CircleAvatar(
                      child: icon,
                      radius: 70.0,
                    ),
                  ),
                  Text(
                    menu,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(25.0),
                  elevation: 10.0,
                  color: Colors.purpleAccent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return SmsScanner(message: "Log-in",);
                      }));
                    },
                    splashColor: Colors.yellowAccent,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.camera,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "LOG-IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.pinkAccent, width: 5.0),
                          borderRadius: BorderRadius.circular(25.0)),
                      padding: EdgeInsets.all(8.0),
                      height: 200.0,
                      width: MediaQuery.of(context).size.width / 2 - 4,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Material(
                  borderRadius: BorderRadius.circular(25.0),
                  elevation: 10.0,
                  color: Colors.purpleAccent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25.0),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder:(context){
                          return SmsScanner(message: "Log-out",);
                        }
                      ));
                    },
                    splashColor: Colors.yellowAccent,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.camera,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "LOG-OUT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.pinkAccent, width: 5.0),
                          borderRadius: BorderRadius.circular(25.0)),
                      padding: EdgeInsets.all(8.0),
                      height: 200.0,
                      width: MediaQuery.of(context).size.width / 2 - 4,
                    ),
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
