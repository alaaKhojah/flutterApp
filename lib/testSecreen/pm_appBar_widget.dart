import 'package:flutter/material.dart';

class PMAppBarWidget extends StatelessWidget {
  final String appBarTitle;

  const PMAppBarWidget({Key key, this.appBarTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color color = Colors.indigoAccent;

    return Stack(
      children: <Widget>[
        Container(
          height: 360,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0)),
              gradient: LinearGradient(colors: [
                color.withOpacity(0.4),
                color,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        Container(
          margin: const EdgeInsets.only(top: 80),
          child: Column(children: <Widget>[
            Center(
              child: Text(
                appBarTitle, //eg create project or edite project, project details
                style: TextStyle(
                  fontFamily: 'ANUDI', fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                    
                    ),
              ),
            ),
            SizedBox(height: 20.0),
          ]),
        ),
      ],
    );
  }
}


