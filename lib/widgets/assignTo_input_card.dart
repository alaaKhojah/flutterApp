import 'package:flutter/material.dart';
import '../models/dummy_maneger.dart';
import '../selection secreens/assignTo_selection.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';

class AssignToInputCard extends StatefulWidget {
  final String pManager;
  AssignToInputCard(this.pManager);
  @override
  _AssignToInputCardState createState() => _AssignToInputCardState();
}

class _AssignToInputCardState extends State<AssignToInputCard> {
  String managerid;
  // bool _isInit = true;
  // String emanagerid;

  @override
  void initState() {
    if (widget.pManager != null) {
      managerid = widget.pManager;
      super.initState();
      // print("manager id: " + managerid);
    }
  }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     if (widget.pManager != null) {
  //        managerid = widget.pManager;
  //        setState(() {
  //           Provider.of<Projects>(context).setManager(Manager(
  //           managerId: widget.pManager,
  //           managerName: "",
  //           managerAvatar: "",
  //           managerPostion: ""));
  //        });
       
  //     }
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  String get getManagerName {
    final loadedManager =
        dummyManagers.firstWhere((mang) => mang.managerId == managerid);
    return loadedManager.managerName.toString();
  }

  String get getManagerAvatar {
    final loadedManager =
        dummyManagers.firstWhere((mang) => mang.managerId == managerid);
    return loadedManager.managerAvatar.toString();
  }

  awaitReturnValueFromManagersOptionScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    String managerResult = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AssignToSelection(),
        ));

    setState(() {
      managerid = managerResult;
    });

    Scaffold.of(context).hideCurrentSnackBar();
    //// after the SecondScreen result comes back show the snackbar with selected option
    Scaffold.of(context).showSnackBar(new SnackBar(
      duration: Duration(seconds: 5),
      content: Row(
        children: <Widget>[
          Text(" project manager is  "),
          Text(
            managerid,
            style: Theme.of(context).textTheme.body1,
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 10.0,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    awaitReturnValueFromManagersOptionScreen(context);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.purple,
                        size: 30,
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Project Manager",
                            style:
                                // TextStyle(fontSize: 16.0, color: Colors.indigoAccent),
                                Theme.of(context).textTheme.body1),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
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
          managerid == null || managerid == ''
              ? Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Center(
                        child: Text("select manager",
                            style: Theme.of(context).textTheme.body2)),
                  ),
                )
              : Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                      // top: 10,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          awaitReturnValueFromManagersOptionScreen(context);
                        },
                        // splashColor: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          height: 500,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 0,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20.0,
                                backgroundImage: NetworkImage(getManagerAvatar),
                                backgroundColor: Colors.transparent,
                              ),
                              title: SizedBox(
                                child: Text(
                                  getManagerName.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              trailing: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                  ),
                                  // color: Theme.of(context).errorColor,
                                  onPressed: () => {}),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 10,
          )
        ]);
  }
}
