import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  final Color bgcolor;
  final String text;
  final Container icon;
  final String tag;
  final MaterialPageRoute page;
  MenuBox({Key key, this.icon,this.text,this.bgcolor, this.page,this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    color: bgcolor,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25.0),
                      splashColor: Colors.yellowAccent,
              
                        onTap: (){
                          Navigator.of(context).push(page);
                        },
                      child: Container(
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Hero(
                                tag: tag,
                                child: icon),
                              SizedBox(height: 8.0,),
                              
                              Text(text,textAlign: TextAlign.center, style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.white,
                            ),)
                            ],
                          ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0)),
                        height: MediaQuery.of(context).size.height / 2 - 150.0,
                      ),
                    ),
                  );
    
  }
}