import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/projects_provider.dart';
// import './sereens/projects_overview_screen.dart';
import './sereens/myProfile_secreen.dart';
import './sereens/tabs_screen.dart';
import './sereens/create_project_screen.dart';
import './sereens/project_details_screen.dart';
// import './selection secreens/assignTo_selection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value:
          Projects(), //return a new instance of your provided class not return widget,
      // and all chiled widget can now set up a listener to this instance of this class
      //  and whenever change something in class and call notifylistener the widget that listent are rebuild
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // primaryColor: primaryColor,
          textTheme: TextTheme(
            body1: TextStyle(
                color: Colors.indigoAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            body2: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigoAccent,
          iconTheme: IconThemeData(color: Colors.indigoAccent),
          appBarTheme: AppBarTheme(
            color: Colors.indigoAccent,
            elevation: 10.0,
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
          // primarySwatch: Colors.blue,
        ),
        home: TabsScreen(),
        routes: {
          // ProjectsScreen.routeName: (ctx)=> ProjectsScreen(),
          CreateProject.routeName: (ctx) => CreateProject(),
          ProjectDetails.routeName: (ctx) => ProjectDetails(),
          // AssignToSelection.routeName: (ctx)=>AssignToSelection(),
          MyProfileScreen.routeName: (ctx) => MyProfileScreen(),
          // DescriptionInput.routeName:(ctx) => DescriptionInput(),
        },
      ),
    );
  }
}
