import 'package:flutter/material.dart';
import '../models/project.dart';
import '../selection secreens/project_status_selection.dart';
import '../selection secreens/project_type_selection.dart';

class ProjectCategoriesCard extends StatefulWidget {
  // final projectType.Type projectType;
  // final projectType.Status status;
  // ProjectCategoriesCard(this.projectType, this.status);
  @override
  _ProjectCategoriesCardState createState() => _ProjectCategoriesCardState();
}

class _ProjectCategoriesCardState extends State<ProjectCategoriesCard> {
  Status currentStatus;
  Type selectedType;

  String get projState {
    switch (currentStatus) {
      case Status.Open:
        return 'open';
        break;
      case Status.InProgress:
        return 'In Progress';
        break;

      case Status.Hold:
        return 'hold';
        break;
      case Status.Cancelled:
        return 'Cancelled';
        break;
      case Status.Executed:
        return 'Executed';
        break;
      default:
        return 'select one';
    }
  }

  awaitReturnValueFromStatesOptionScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    dynamic statuesResult = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectStatusSelection(),
        ));

    currentStatus = statuesResult;

    Scaffold.of(context).hideCurrentSnackBar();
    //// after the SecondScreen result comes back show the snackbar with selected option
    Scaffold.of(context).showSnackBar(new SnackBar(
      duration: Duration(seconds: 5),
      content: Row(
        children: <Widget>[
          Text("Your project is in "),
          Text(
            "$projState",
            style: Theme.of(context).textTheme.body1,
          ),
          Text(" Status"),
        ],
      ),
    ));
  }

  awaitReturnValueFromProjectTypeOptionScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    dynamic typeResult = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectTypeSelection(),
        ));

    selectedType = typeResult;
    Scaffold.of(context).hideCurrentSnackBar();
    //// after the SecondScreen result comes back show the snackbar with selected option
    Scaffold.of(context).showSnackBar(new SnackBar(
      duration: Duration(seconds: 5),
      content: Row(
        children: <Widget>[
          Text("Your project type is "),
          Text(
            typeMap[selectedType]['text'],
            style: Theme.of(context).textTheme.body1,
          ),
         
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //____________________________ 1) frist Column to show the Catagories boutton to show the options page__________________________________________________________
        Row(
          children: <Widget>[
            // A) button to show project type otion
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    awaitReturnValueFromProjectTypeOptionScreen(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.category, size: 30, color: Colors.amber),
                        SizedBox(
                          width: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Type",
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // _bulidInkWellCategory(context, "type", Icons.category, Colors.amber, awaitReturnValueFromSecondScreen(context, ProjectTypeSelection(),currentStatus)),
            VerticalDivider(
              color: Colors.grey,
            ),
            // _bulidInkWellCategory(context, "status", Icons.poll, Colors.green, awaitReturnValueFromSecondScreen(context, ProjectStatusSelection(),currentStatus)),

            //B) button to show project Status otion
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    awaitReturnValueFromStatesOptionScreen(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.poll, size: 30, color: Colors.green),
                        SizedBox(
                          width: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Status",
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),

        //__________________ 2) secound coulunm to Show selected Data Options_____________________________________________________________________________
        Row(
          children: <Widget>[
            // A) to show Project selected type
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 5, right: 0),
                child: Container(
                  height: 50,
                  // color: Colors.green,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        
                        child: selectedType == null ? Text("select one", style: Theme.of(context).textTheme.body2)
                     : Text(typeMap[selectedType]['text'], style: Theme.of(context).textTheme.body2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.grey,
              width: 36,
            ),
            // b) to show project selected status
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 5, right: 10),
                child: Container(
                    height: 50,
                    // color: Colors.green,
                    child: Row(
                      children: <Widget>[
                        currentStatus == null
                            ? Text("")
                            : Icon(resultsMap[currentStatus]['icons'],
                                color: resultsMap[currentStatus]['color']),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          projState,
                          style: Theme.of(context).textTheme.body2,
                        ),
                      ],
                    )
                    //  TextStyle(
                    //           fontSize: 16, fontWeight: FontWeight.bold , color: Colors.black)),
                    ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

// Widget _bulidInkWellCategory(BuildContext ctx, String categoryName,
//     IconData categoryIcon, Color color, Function fun ) {

//   return Expanded(
//     child: Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: () { fun();
//           // Navigator.push(
//           //     ctx,
//           //     MaterialPageRoute(
//           //       builder: (_) => routeName,
//           //     ));
//         },
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20.0, top: 10.0),
//           child: Row(
//             children: <Widget>[
//               Icon(categoryIcon, size: 30, color: color),
//               SizedBox(
//                 width: 7,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   categoryName,
//                   style: Theme.of(ctx).textTheme.body1,
//                 ),
//               ),
//               Spacer(),
//               Icon(
//                 Icons.arrow_drop_down,
//                 size: 30,
//                 color: Colors.grey,
//               ),
//               SizedBox(
//                 width: 10,
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
