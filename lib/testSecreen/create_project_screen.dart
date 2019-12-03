import 'package:flutter/material.dart';
import '../testSecreen/projectCardForm_widget.dart';
import '../testSecreen/pm_appBar_widget.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateProject extends StatefulWidget {
  static const routeName = 'create-project';

  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
    final Color color = Colors.indigoAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PMAppBarWidget(appBarTitle: "Create New Project"),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 100.0),
              child: new Column(
                children: <Widget>[
                  // SizedBox(height: 40,),
                  _dateofDay(),
                  Expanded(child: ProjectCardForm()),
                   _createButton( color)
                  // Container(),  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _createButton( Color buttonColor){

  return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          margin: const EdgeInsets.only(
              top: 30, left: 20.0, right: 20.0, bottom: 20.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [buttonColor.withOpacity(0.4), buttonColor],
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  /*...*/
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add_box),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Create ",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
}

Widget _dateofDay() {
  return 
  // Container(
  //   alignment: Alignment.topCenter,
  //   child: 
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.calendar,
            color: Colors.indigoAccent,
            size: 25.0,
          ),
          SizedBox(
            width: 10,
          ),
          Text(DateFormat.yMMMd().format(
            DateTime.now(),
          )),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    // ),
  );
}
