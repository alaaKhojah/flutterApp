import 'package:flutter/material.dart';
import '../testSecreen/projects_input.dart';

class ProjectCardForm extends StatefulWidget {
  @override
  _ProjectCardFormState createState() => _ProjectCardFormState();
}

class _ProjectCardFormState extends State<ProjectCardForm> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: new Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              children: <Widget>[
                _buildContentContainer(viewportConstraints),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: new IntrinsicHeight(
            child: _cardContent(),
            
          ),
        ),
      ),
    );
  }

  Widget _cardContent() {
    return Column(
      children: <Widget>[
        ProjectInputs(),
        Expanded(child: Container()),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
        //   child: FloatingActionButton(
        //     onPressed: () {},
        //     child: Icon(Icons.timeline, size: 36.0),
        //   ),
        // ),
        
      ],
    );
  }
}


