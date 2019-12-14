import 'package:flutter/material.dart';
import '../sereens/projects_overview_screen.dart';
import '../sereens/myProfile_secreen.dart';
import '../sereens/create_project_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': ProjectsScreen(),
      'title': 'All Projects',
    },
    {
      'page': MyProfileScreen(),
      'title': 'My Profile',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Color bgColor = Color(0xffF3F3F3);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(

        //     title: Text(_pages[_selectedPageIndex]['title']),

        // ),
        drawer: Drawer(),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 10,
              // expandedHeight: 300,
              pinned: false,
              floating: false,
              snap: false,
              // flexibleSpace: FlexibleSpaceBar(
                  title: Text(_pages[_selectedPageIndex]['title']),
                  
              // ),
              
            ),
            
            SliverList(
              delegate: SliverChildListDelegate([
                _pages[_selectedPageIndex]['page'],
              ]),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              CreateProject.routeName,
            );
          },
          tooltip: 'Increment',
          child: Icon(
            Icons.add,
          ),
          elevation: 4.0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation:4,
          onTap: _selectPage,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.shifting,

          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(Icons.category),
              title: Text('All Projects'),
            ),
            BottomNavigationBarItem(
              // backgroundColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).accentColor,
              icon: Icon(Icons.account_circle),
              title: Text('My Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
