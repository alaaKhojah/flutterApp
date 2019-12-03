import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';

class ProjectDetails extends StatelessWidget {
  static const routeName ='project-details';
  @override
  Widget build(BuildContext context) {
    final projectId= ModalRoute.of(context).settings.arguments as int;
    final loadedProject =Provider.of<Projects>(context, listen: false).findById(projectId);

    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProject.title)),
        );
        
      
    
  }
}

