import 'package:flutter/material.dart';
import 'package:pm_app/models/project.dart';
// import 'package:pm_app/models/project.dart';
// import 'package:pm_app/models/project.dart' as prefix0;
import 'package:provider/provider.dart';
import '../widgets/cardBox.dart';
import '../widgets/name_input.dart';
import '../widgets/assignTo_input_card.dart';
import '../widgets/date_input.dart';
import '../widgets/project_categories_inputs.dart';
import '../widgets/description_card.dart';
import '../providers/projects_provider.dart';
// import '../models/project.dart';

class CreateProject extends StatefulWidget {
  static const routeName = 'create-project';

  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  final Color color = Colors.indigoAccent;
  final Color bgColor = Color(0xffF3F3F3);
  final _form = GlobalKey<FormState>();

  var _isInit = true;

  var _editedProject = Project(
    id: null,
    title: '',
    desceiption: '',
    startDate: null,
    dueDate: null,
    pType: null,
    pState: null,
    projectManager: null,
  );

  Map<String, dynamic> _initValues = {
    'id': null,
    'title': '',
    'description': '',
    'startDate': '',
    'dueDate': '',
    'ptype': null,
    'pstatus': null,
    'manager': '',
  };
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final projectId = ModalRoute.of(context).settings.arguments as int;
      if (projectId != null) {
        _editedProject =
            Provider.of<Projects>(context, listen: false).findById(projectId);
        // print(projectId);
        _initValues = {
          'title': _editedProject.title,
          'description': _editedProject.desceiption,
          'startDate': _editedProject.startDate.toString(),
          'dueDate': _editedProject.dueDate.toString(),
          'ptype': _editedProject.pType,
          'pstatus': _editedProject.pState,
          'manager': _editedProject.projectManager.managerId,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void saveProjectFun() {
    final projectProvider = Provider.of<Projects>(context);
_form.currentState.save();
    //   final addnp= Project(id: null, title: projectProvider.getPtitile, desceiption:  projectProvider.getpDescription, startDate:projectProvider.getsetPStartDate
    //  , dueDate: projectProvider.getsetPDueDate,  pState: projectProvider.getPStatus, pType: projectProvider.getsetPType, projectManager: projectProvider.getManager);

    //   projectProvider._items.add(addnp);

    if (_editedProject.id != null) {
      _editedProject = Project(
        id: _editedProject.id,
        title: projectProvider.getPtitile ,
        desceiption: projectProvider.getpDescription,
        startDate: projectProvider.getsetPStartDate,
        dueDate: projectProvider.getsetPDueDate,
        pType: projectProvider.getsetPType,
        pState: projectProvider.getPStatus,
        projectManager: projectProvider.getManager,
      );
      // _editedProject= projectProvider.getProject;
      projectProvider.updateProject(_editedProject.id, _editedProject);
    } else {
      projectProvider.addProject();
    }
    print(_editedProject.id);
    print(_editedProject.title);
    print('....');
    print(projectProvider.getPtitile);
    print(projectProvider.getpDescription);
    print(projectProvider.getsetPStartDate);
    print(projectProvider.getsetPDueDate);
    print(projectProvider.getsetPType);
    print(projectProvider.getPStatus);
    print(projectProvider.getManager.managerId);
    projectProvider.setPtitle(null);
    projectProvider.setpDescription(null);
    projectProvider.setPStartDate(null);
    projectProvider.setPDueDate(null);
    projectProvider.setPType(null);
    projectProvider.setPStatus(null);
    projectProvider.setManager(null);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // expandedHeight: 300,
            pinned: false,
            floating: false,
            snap: false,
            // flexibleSpace: FlexibleSpaceBar(
            //     title: Text("Create new project", style:Theme.of(context).textTheme.title),
            // ),
            title: Text(_editedProject.id==null? "Create new project": "Update your project info"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.save, color: Colors.white),
                tooltip: 'Add new project',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Form(
             key: _form,
            child: SliverList(
              delegate: SliverChildListDelegate([
                CardBox(100.0, NameInputCard(_initValues['title'])),
                CardBox(140.0, AssignToInputCard(_initValues['manager'])),
                CardBox(120.0,DateInputCard(_initValues['startDate'], _initValues['dueDate'])),
                CardBox(110.0, ProjectCategoriesCard(_initValues['ptype'], _initValues['pstatus'])),
                CardBox(170, DescriptionInputCard(_initValues['description'])),
                SizedBox(height: 20,),
               
                _createButton(context, color, saveProjectFun, _editedProject.id),
              ]),
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () { },
      //   child: Icon(
      //     Icons.create_new_folder,
      //   ),
      //   elevation: 4.0,
      // ),
    );
  }
}

Widget _createButton(BuildContext ctx, Color buttonColor, Function fun, int projectid) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
    margin:
        const EdgeInsets.only(top: 30, left: 20.0, right: 20.0, bottom: 20.0),
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
          onPressed: fun,
          // () {
          //   Navigator.of(ctx).pop();
          // },
          child: Row(
            children: <Widget>[
              Icon(Icons.add_box),
              SizedBox(
                width: 10,
              ),
              Text(
                projectid == null?
                "Create "
                : "update",
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
