import 'package:flutter/material.dart';
import '../models/dummy_maneger.dart';
import '../selection secreens/assignTo_selection.dart';

class AssignToInputCard extends StatefulWidget {
  final String pManager;
  AssignToInputCard(this.pManager);
  @override
  _AssignToInputCardState createState() => _AssignToInputCardState();
}

class _AssignToInputCardState extends State<AssignToInputCard> {
  String managerid;
  String emanagerid;

   @override
  void initState() {
    emanagerid = widget.pManager;
    super.initState(); 
    print(emanagerid);
  }
 dynamic get eManagerName {
    if(managerid != null)
    {final loadedManager =
        dummyManagers.firstWhere((mang) => mang.managerId == managerid );
    return loadedManager.managerName.toString();}
    else if(emanagerid != null){
      final loadedManager =
        dummyManagers.firstWhere((mang) => mang.managerId == emanagerid );
    return loadedManager.managerName.toString();
    }
  }
  dynamic get eManagerAvatar {
    if(managerid != null)
    {final loadedManager =
        dummyManagers.firstWhere((mang) => mang.managerId == managerid );
    return loadedManager.managerAvatar.toString();}
    else if(emanagerid != null){
      final loadedManager =
        dummyManagers.firstWhere((mang) => mang.managerId == emanagerid );
    return loadedManager.managerAvatar.toString();
    }
  }


  // String get getManagerName {
  //  final loadedManager =
  //       dummyManagers.firstWhere((mang) => mang.managerId == managerid );
  //   return loadedManager.managerName.toString();
  //   }

  // String get getManagerAvatar {
  //   final loadedManager =
  //       dummyManagers.firstWhere((mang) => mang.managerId == managerid);
  //   return loadedManager.managerAvatar.toString();
  // }

  awaitReturnValueFromManagersOptionScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    String managerResult = await
        Navigator.push(
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
           (managerid==null && emanagerid ==null) || (managerid==null && emanagerid!=null)?
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Center(
                        child: Text("select manager",
                            style: Theme.of(context).textTheme.body2)),
                  ),
                ):
          //  ( emanagerid!=null && managerid==null) || ( emanagerid!=null && managerid!=null) && ( managerid!=null) &&(emanagerid!=null)
        //  ( emanagerid!=null || managerid!=null) 
              // ?  
              Expanded(
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
                                backgroundImage: NetworkImage(eManagerAvatar),
                                backgroundColor: Colors.transparent,
                              ),
                              title: SizedBox(
                                child: Text(
                                  eManagerName.toString(),
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
