import 'package:flutter/material.dart';
import 'package:myapplication/pages/studentlist.dart';

class AdminMenu extends StatelessWidget {
  final String title;
  final Container icon;
  final String tag;
  const AdminMenu({Key key,this.title,this.icon,this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: StudenList(menu:title,icon: icon,tag:tag),

    );
    
  }
}