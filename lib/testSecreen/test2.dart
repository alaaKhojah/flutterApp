import 'package:flutter/material.dart';
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
            child: Column(
              children: <Widget>[
                Text(
                  "Create Project",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          height: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child:
                           Card(
                            elevation: 4,
                            child: Container(
                              height: double.infinity,
                               margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                              child: Form(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: <Widget>[
                                       Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 64.0, 8.0),
                                          child: TextFormField(
                                            cursorColor: Colors.indigoAccent,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.title,
                                                  color: Colors.indigoAccent),
                                              labelText: "Project Title",
                                            ),
                                          ),
                                        ),
                                      
                                       Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 64.0, 8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.multiline,
                                            maxLines: 5,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.description,
                                                  color: Colors.indigoAccent),
                                              labelText: "description",
                                            ),
                                          ),
                                        ),
                                     
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 64.0, 8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.person,
                                                  color: Colors.indigoAccent),
                                              labelText: "Project Manager",
                                            ),
                                          ),
                                        ),
                                     Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16.0),
                                              child: Icon(Icons.date_range,
                                                  color: Colors.indigoAccent),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16.0),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                      labelText: "Start Date"),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                      labelText: "Due Date"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 64.0, 8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.merge_type,
                                                  color: Colors.indigoAccent),
                                              labelText: "Project Type",
                                            ),
                                          ),
                                        ),
                                     Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 64.0, 8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.group_work,
                                                  color: Colors.indigoAccent),
                                              labelText: "Project status",
                                            ),
                                          ),
                                        ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(20.0)),
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
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 16.0),
                        margin: const EdgeInsets.only(
                            top: 30, left: 20.0, right: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [color.withOpacity(0.4), color],
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
         
        ],
        
      ),
      
    );
  }
}
