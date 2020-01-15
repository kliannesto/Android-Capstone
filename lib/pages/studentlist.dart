import 'package:flutter/material.dart';
import 'package:myapplication/pages/add_event.dart';
import 'package:myapplication/pages/smsscanner.dart';
import 'package:myapplication/widgets/students.dart';

class StudenList extends StatelessWidget {
  final String menu;
  final Container icon;
  final String tag;
  const StudenList({Key key, this.menu, this.icon, this.tag})
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
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[
                        Colors.blue,
                        Colors.greenAccent,
                      ],
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(1, 0),
                      stops: [0, 1],
                      tileMode: TileMode.clamp)),
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
            Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return AddEvent(
                          );
                        }));
                      },
                      splashColor: Colors.yellowAccent,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.event,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Add Event",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(25.0)),
                        padding: EdgeInsets.all(8.0),
                        height: 150.0,
                        width: MediaQuery.of(context).size.width / 2 - 4,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return StudentList(
                          );
                        }));
                      },
                      splashColor: Colors.yellowAccent,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.list,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Students List",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(25.0)),
                        padding: EdgeInsets.all(8.0),
                        height: 150.0,
                        width: MediaQuery.of(context).size.width / 2 - 4,
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class HomeSMS extends StatefulWidget {
  HomeSMS({Key key}) : super(key: key);

  _HomeSMSState createState() => _HomeSMSState();
}

class _HomeSMSState extends State<HomeSMS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        body: StudenList(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("MENU"),
                centerTitle: true,
              ),
            )
          ];
        },
      ),
    );
  }
}
