import 'dart:core';
import 'package:flutter/material.dart';
// import 'package:pm_app/models/project.dart' as prefix0;
import '../models/project.dart';
import '../models/dummy_maneger.dart' as m;

class Projects with ChangeNotifier {
  List<Project> _items = [
    Project(
        id: 1,
        title: 'project 1',
        desceiption: 'tampelte of project 1',
        projectManager: m.Manager(
            managerId: "1",
            managerName: "Alaa",
            managerPostion: "CEO",
            managerAvatar: "https://i.imgur.com/BoN9kdC.png"),
        startDate: new DateTime.utc(2019, 10, 9),
        dueDate: new DateTime.utc(2019, 11, 9),
        pState: Status.Hold,
        pType: Type.Business,
        color: Colors.cyan),
    Project(
        id: 2,
        title: 'project 2 ',
        desceiption: 'tampelte of project 2',
        projectManager: m.Manager(
            managerId: "2",
            managerName: "Asmaa",
            managerPostion: "CFO",
            managerAvatar: "https://i.imgur.com/BoN9kdC.png"),
        startDate: new DateTime.utc(2019, 11, 9),
        dueDate: new DateTime.utc(2019, 12, 9),
        pState: Status.Open,
        pType: Type.Educational,
        color: Colors.cyan),
    Project(
      id: 3,
      title: 'project 3',
      desceiption: 'tampelte of project 3',
      projectManager: m.Manager(
          managerId: "5",
          managerName: "Bshayer",
          managerPostion: "HR",
          managerAvatar: "https://i.imgur.com/BoN9kdC.png"),
      startDate: DateTime.utc(2020, 11, 9),
      dueDate: DateTime.utc(2020, 12, 9),
      pState: Status.Cancelled,
      pType: Type.Business,
      color: Colors.pink[200],
    ),
  ];
  List<Project> get items {
    return [..._items];
  }

  Project findById(int id) {
    return _items.firstWhere((proj) => proj.id == id);
  }

  // Project _newProjectData = Project(
  //     id: null,
  //     title: "",
  //     desceiption: "",
  //     projectManager: null,
  //     startDate: null,
  //     dueDate: null,
  //     pType: Type.Others,
  //     pState: Status.Hold);
  // void setNewProjectData(Project project){
  //   _newProjectData = project;
  //   notifyListeners();
  // }
  // Project get getNewProjectData  => _newProjectData;
//________________________________
  String _pTitle = "";
  setPtitle(String title) {
    _pTitle = title;
    notifyListeners();
  }

  String get getPtitile => _pTitle;
  //_____________
  String _pDescription = "";
  void setpDescription(String descruptio) {
    _pDescription = descruptio;
    notifyListeners();
  }

  String get getpDescription => _pDescription;

  //_______________
  DateTime _pStartDate;
  DateTime _pDueDate;
  void setPStartDate(DateTime start) {
    _pStartDate = start;
    notifyListeners();
  }

  DateTime get getsetPStartDate => _pStartDate;

  void setPDueDate(DateTime due) {
    _pDueDate = due;
    notifyListeners();
  }

  DateTime get getsetPDueDate => _pDueDate;
//______________
  m.Manager _pManager = m.Manager(
      managerId: "", managerName: "", managerAvatar: "", managerPostion: "");
  void setManager(m.Manager mang) {
    _pManager = mang;
    notifyListeners();
  }

  m.Manager get getManager => _pManager;
//________________
  Status _pStatus;

  void setPStatus(Status state) {
    _pStatus = state;
    notifyListeners();
  }

  Status get getPStatus => _pStatus;
//_________________
  Type _pType;

  void setPType(Type t) {
    _pType = t;
    notifyListeners();
  }

  Type get getsetPType => _pType;
  //________________

  // Project get getProject {
  //   return
  //   Project(
  //       id: null,
  //       title: _pTitle,
  //       desceiption: _pDescription,
  //       startDate: _pStartDate,
  //       dueDate: _pDueDate,
  //       pType: _pType,
  //       pState: _pStatus,
  //       projectManager: _pManager);
  // }

  void addProject() {
    Project addnp = Project(
        id: null,
        title: getPtitile,
        desceiption: getpDescription,
        startDate: getsetPStartDate,
        dueDate: getsetPDueDate,
        pState: getPStatus,
        pType: getsetPType,
        projectManager: getManager);
    // Project addnp= getProject;

    _items.insert(0, addnp);

    notifyListeners();
  }

  void updateProject(int id, Project updatedProjectInfo) {
    final projIndex = _items.indexWhere((proj) => proj.id == id);

    if (projIndex >= 0) {
      // updatedProjectInfo = Project(
      //     id: projIndex,
      //     title: _pTitle,
      //     desceiption: _pDescription,
      //     startDate: _pStartDate,
      //     dueDate: _pDueDate,
      //     pState: _pStatus,
      //     pType: _pType,
      //     projectManager: _pManager);
      _items[projIndex] = updatedProjectInfo;
      notifyListeners();
    } else {
      print('...');
    }
  }
}
