import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cardBox.dart';
import '../widgets/name_input.dart';
import '../widgets/assignTo_input_card.dart';
import '../widgets/date_input.dart';
import '../widgets/project_categories_inputs.dart';
import '../widgets/description_card.dart';
import '../providers/projects_provider.dart';
import '../models/project.dart';


class CreateProject extends StatefulWidget {

  static const routeName = 'create-project';

  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  final Color color = Colors.indigoAccent;

  final Color bgColor = Color(0xffF3F3F3);

  // String projectTitle;

  @override
  Widget build(BuildContext context) {
 final projectProvider= Provider.of<Projects>(context);

   void addNewProjectFun(){
  //   final addnp= Project(id: null, title: projectProvider.getPtitile, desceiption:  projectProvider.getpDescription, startDate:projectProvider.getsetPStartDate
  //  , dueDate: projectProvider.getsetPDueDate,  pState: projectProvider.getPStatus, pType: projectProvider.getsetPType, projectManager: projectProvider.getManager);
   
  //   projectProvider._items.add(addnp);
  projectProvider.addProject();
     print(projectProvider.getPtitile) ;
    print(projectProvider.getpDescription);
    print(projectProvider.getsetPStartDate);
    print(projectProvider.getsetPDueDate);
    print(projectProvider.getsetPType);
    print(projectProvider.getPStatus);
    print(projectProvider.getManager.managerId);
    Navigator.of(context).pop();
  }

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
            title: Text("Create new project"),
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
            child: SliverList(
              delegate: SliverChildListDelegate([
                CardBox(100.0, NameInputCard()),
                CardBox(140.0, AssignToInputCard()),
                CardBox(120.0, DateInputCard()),
                CardBox(110.0, ProjectCategoriesCard()),
                CardBox(170, DescriptionInputCard()),
                SizedBox(
                  height: 20,
                ),
                _createButton(context,color, addNewProjectFun),
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



Widget _createButton(BuildContext ctx,Color buttonColor, Function fun) {
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
