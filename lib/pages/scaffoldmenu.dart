import 'package:flutter/material.dart';
import 'package:myapplication/widgets/smsmenu.dart';

class ScaffoldMenu extends StatelessWidget {
  final String title;
  final Container icon;
  final String tag;
  const ScaffoldMenu({Key key,this.title,this.icon,this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU"),
      ),
      body: SmsMenuBody(menu:title,icon: icon,tag:tag),

    );
    
  }
}