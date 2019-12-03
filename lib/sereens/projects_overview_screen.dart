import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/project.dart';
import '../providers/projects_provider.dart';
import '../widgets/project_card.dart';
import '../widgets//searchBar_widget.dart';

class ProjectsScreen extends StatefulWidget {
  static const routeName = 'projects-overview';

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final TextEditingController _searchController = new TextEditingController();
  List<Project> searchresult = new List();
  void searchOperation(String searchText) {
    searchresult.clear();
    if (searchText.isEmpty) {
      setState(() {});
      return;
    }
    final projectsData = Provider.of<Projects>(context);
    final projects = projectsData.items;
    projects.forEach((allproject) {
      if (allproject.title.toLowerCase().contains(searchText) ||
          allproject.title.toLowerCase().startsWith(searchText))
        searchresult.add(allproject);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //to get all projects data from projects_provider.dart (Projects instance)
    final projectsData = Provider.of<Projects>(context);
    final projects = projectsData.items;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // _buildsearchBar(_searchController, searchOperation),
            SearchBarWidget(_searchController.text, searchOperation),
            projects.isEmpty
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'No Projects added yet!',
                        style: Theme.of(context).textTheme.title,
                        // TextStyle(color: Colors.indigoAccent)
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          height: 300,
                          child: Image.asset(
                            // 'assets/imgs/projects.png',
                            'assets/imgs/noproject.png',
                            fit: BoxFit.cover,
                          )),
                    ],
                  )
                : Container(
                    height: 500,
                    child: searchresult.length != 0 ||
                            _searchController.text.isNotEmpty
                        ? _searchResultGridView(searchresult)
                        : _allProjectGridView(projects))
          ],
        ),
      ),
    );
  }
}
//show the project based on the search result about project name 
Widget _searchResultGridView(List<Project> searchresult) {
  return GridView.builder(
    padding: const EdgeInsets.all(20.0),
    itemCount: searchresult.length,
    itemBuilder: (ctx, i) => ProjectCard(
      searchresult[i].id,
      searchresult[i].title,
      searchresult[i].projectManager,
      searchresult[i].dueDate,
      searchresult[i].pState,
      searchresult[i].pType,
      searchresult[i].color,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    ),
  );
}
// show all project 
Widget _allProjectGridView(List projects) {
  return GridView.builder(
    padding: const EdgeInsets.all(20.0),
    itemCount: projects.length,
    itemBuilder: (ctx, i) => ProjectCard(
      projects[i].id,
      projects[i].title,
      projects[i].projectManager,
      projects[i].dueDate,
      projects[i].pState,
      projects[i].pType,
      projects[i].color,
    ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    ),
  );
}
