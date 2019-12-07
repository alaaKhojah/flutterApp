import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pm_app/models/dummy_maneger.dart';
import '../models/project.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';
import '../sereens/create_project_screen.dart';
import '../sereens/project_details_screen.dart';

class ProjectCard extends StatelessWidget {
  final int id;
  final String titel;
  final DateTime dueDate;
  final Manager projectManeger;
  final Status pState;
  final Type pType;
  final Color color;

  ProjectCard(this.id, this.titel, this.projectManeger, this.dueDate,
      this.pState, this.pType, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.4),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: GridTile(
          header: _popMenu(context, id),
          child: _projectInfo(titel, dueDate, projectManeger.managerName,projectManeger.managerAvatar, pState, context)),
    );
  }
}

Widget _popMenu(BuildContext ctx, int id) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      PopupMenuButton(
        onSelected: (int selectedValue) {
          // setState(() {
          if (selectedValue == 0) {
            // Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
            //   return CreateProject();
            // }));
            Navigator.of(ctx).pushNamed(
              CreateProject.routeName,
              arguments: id
            );
          } else {
            Navigator.of(ctx).pushNamed(
              ProjectDetails.routeName,
              arguments: id,
            );
          }
          // });
        },
        icon: Icon(
          FontAwesomeIcons.ellipsisV,
          size: 15.0,
        ),
        itemBuilder: (_) => [
          PopupMenuItem(
              value: 0,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Edite'),
                ],
              )),
          PopupMenuItem(
              value: 1,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.info,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Show Details'),
                ],
              )),
        ],
      ),
    ],
  );
}

Widget _projectInfo(String titel, DateTime dueDate, String pManager, String avtar,
    Status pState, BuildContext context) {
  return Container(
    //     width: MediaQuery.of(context).size.width,
    height: double.infinity,

    padding: const EdgeInsets.all(15),
    child: Column(
      // mainAxisSize:MainAxisSize.min ,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(height: 10),

        //project name
        Expanded(
          flex: 1,
          child: FittedBox(
            child: Text(titel,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        //project due date
        Expanded(
          flex: 1,
          child: FittedBox(
            child: Text(DateFormat.yMMMd().format(dueDate),
                style: TextStyle(color: Colors.white60, fontSize: 10.0)),
          ),
        ),
        SizedBox(height: 10),
        // project manager & state
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: _buildPManager(context, pManager, avtar),
            ),
            // VerticalDivider(color: Colors.black,width: 10,),
            Flexible(
              flex: 1,
              child: FittedBox(child: _buildProjectState(context, pState)),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        // project tasks progress
        Flexible(
          flex: 1,
          child: _pTasksProgressBar(),
        ),
      ],
    ),
  );
}

Widget _buildPManager(
  BuildContext ctx,
  String pm,
  String avatar
) {
  return Column(
    children: <Widget>[
      CircleAvatar(
        radius: 20.0,
        backgroundImage: NetworkImage(avatar),
        backgroundColor: Colors.transparent,
      ),
      SizedBox(height: 10),
      FittedBox(
        child: Text(
          pm, softWrap: true,
          style: Theme.of(ctx).textTheme.body2,
          // style: TextStyle(
          //           color: Colors.black,
          //           fontSize:  14.0,
          //           fontWeight: FontWeight.bold),
          // maxLines: 3,
        ),
      ),
    ],
  );
}

Widget _buildProjectState(BuildContext ctx, Status c) {
  return Column(
    children: <Widget>[
      CircleAvatar(
        backgroundColor: Colors.white30,
        radius: 20,
        child: FittedBox(
          child: Icon(
            resultsMap[c]['icons'],
            color: resultsMap[c]['color'],
          ),
        ),
      ),
      SizedBox(height: 10),
      Text(
        resultsMap[c]['text'],
        textAlign: TextAlign.center,
        style: Theme.of(ctx).textTheme.body2,
      ),
    ],
  );
}

Widget _pTasksProgressBar() {
  return LinearPercentIndicator(
    // width: MediaQuery.of(context).size.width -20,
    // width: 120,
    animation: true,
    lineHeight: 7.0,
    animationDuration: 2500,
    percent: 0.4,
    // center: Text("20.0%"),
    trailing: new Text(
      "20%",
      style: TextStyle(
          color: Colors.amber, fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    linearStrokeCap: LinearStrokeCap.roundAll,
    progressColor: Colors.indigoAccent,
    backgroundColor: Colors.white30,
  );
}
