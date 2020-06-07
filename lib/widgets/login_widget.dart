import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/event_attendance.dart';
import '../services/api_services.dart';

class LoginWidget extends StatefulWidget {
  final Function(User user) onLoginSuccess;
  final Future<bool> Function(Credential credential) authUser;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  const LoginWidget(
      {Key key,
      this.onLoginSuccess,
      this.authUser,
      this.usernameController,
      this.passwordController})
      : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/id-card.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: widget.usernameController,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (String val) {
        if (val == "") {
          return "Please fill the username field!";
        }
        return null;
      },
    );

    final password = TextFormField(
      autofocus: false,
      controller: widget.passwordController,
      obscureText: true,
      validator: (String val) {
        if (val == "") {
          return "Please fill the password field!";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            context.read<EventAttendance>().authenticate(true);
            final bool isAuth = await widget.authUser(Credential(
                username: widget.usernameController.text,
                password: widget.passwordController.text));
            if (isAuth) {
              context.read<EventAttendance>().authenticate(false);
              widget.onLoginSuccess(User(is_admin: true, is_auth: true));
            } else {
              context.read<EventAttendance>().authenticate(false);
            }
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Log In', style: TextStyle(color: Colors.white)),
          SizedBox(
            width: 16.0,
          ),
          Consumer<EventAttendance>(
            builder: (context, event, _) {
              if (event.isAuthenticating) {
                return Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                    height: 20,
                    width: 20,
                  ),
                );
              }
              return Container();
            },
          ),
        ]),
      ),
    );

    final loginGuestButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          widget.onLoginSuccess(User(is_admin: false, is_auth: false));
        },
        padding: EdgeInsets.all(12),
        child: Text(
          'Log In as Guest',
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              loginGuestButton,
            ],
          ),
        ),
      ),
    );
  }
}
