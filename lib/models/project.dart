import 'package:flutter/material.dart';
import 'dart:core';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pm_app/models/dummy_maneger.dart';
// import 'package:pm_app/models/dummy_maneger.dart';


enum Status {
  Open,
  Hold,
  InProgress,
  Executed,
  Cancelled,

}

enum Type{
  Medical, Technical, Improvement, Personal, Educational,
  Business ,ServiceProduction, ProductProduction , Others,
}

class Project {
  final int id;
  final String title;
  final String desceiption;
  final Manager projectManager;
  final DateTime startDate;
  final DateTime dueDate;
  final Status pState;
  final Type pType;
  final Color color;

  const Project({
    @required this.id,
    @required this.title,
    @required this.desceiption,
    @required this.projectManager,
    @required this.startDate,
    @required this.dueDate,
    @required this.pState,
    @required this.pType,
    this.color= Colors.indigoAccent,
  });
}
final resultsMap = <Status, Map<String, dynamic>>{
  Status.Open: {'text': 'Open', 'color': Colors.grey,  'icons':FontAwesomeIcons.circle},
  Status.Hold: {'text': 'Hold', 'color': Colors.amber, 'icons':FontAwesomeIcons.pauseCircle},
  Status.InProgress: {'text': 'In Progress', 'color': Colors.blue, 'icons':FontAwesomeIcons.spinner},
  Status.Executed: {'text': 'Executed', 'color': Colors.green, 'icons':FontAwesomeIcons.checkCircle},
  Status.Cancelled: {'text': 'Cancelled', 'color': Colors.red, 'icons':FontAwesomeIcons.timesCircle},

  
};
final typeMap = <Type, Map<String, dynamic>>{
  Type.Business: {'text': 'Business'},
  Type.Educational: {'text': 'Educational'},
  Type.Improvement: {'text': 'Improvement'},
  Type.Technical: {'text': 'Technical'},
  Type.Medical: {'text': 'Medical'},
  Type.Personal: {'text': 'Personal'},
  Type.ProductProduction: {'text': 'Product Production'},
  Type.ServiceProduction: {'text': 'Service Production'},
  Type.Others:{'text': 'Other'},

  
  

};
  