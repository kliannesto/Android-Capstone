import 'package:flutter/material.dart';
import 'package:myapplication/pages/login_page.dart';
import 'package:myapplication/provider/event_attendance.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => EventAttendance(),
        ),
      ],
      child: MaterialApp(
        title: "MyApp",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginPage(),
      ),
    );
  }
}
