import 'package:flutter/material.dart';
import 'package:myapplication/pages/home_page.dart';

import 'package:myapplication/widgets/login_widget.dart';
import 'package:provider/provider.dart';
import '../main.dart';

import '../provider/event_attendance.dart';
import '../services/api_services.dart';

import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<bool> _authUser(Credential data) async {
    final Credential credential =
        Credential(username: data.username, password: data.password);
    final _dio = Dio();
    RestClient client = RestClient(_dio);
    User user = await client.login(credential);

    if (user.is_auth) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return LoginWidget(
      authUser: _authUser,
      passwordController: _passwordController,
      usernameController: _usernameController,
      onLoginSuccess: (User user) {
        context.read<EventAttendance>().addUser(user);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return Homepage();
        }));
      },
    );
  }
}
