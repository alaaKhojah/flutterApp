import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';

class NameInputCard extends StatefulWidget {
  //  String pTitle;
  //  BuildContext context;
  // NameInputCard(this.pTitle, this.context);
  @override
  _NameInputCardState createState() => _NameInputCardState();
}

class _NameInputCardState extends State<NameInputCard> {
  TextEditingController _ptitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<Projects>(context);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.title,
                    size: 30,
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Project Name",
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              bottom: 10,
            ),
            child: TextField(
              controller: _ptitleController,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              cursorColor: Colors.indigoAccent,
              // initialValue: pTitle,
              // onChanged: (value){pTitle=value;},
              // decoration: InputDecoration(
              // labelText: "Project Title",
              // ),
              onChanged: (vChanged) => projectProvider.setPtitle(vChanged),
                
              onSubmitted: (vSubmit) => projectProvider.setPtitle(vSubmit),
            ),
          ),
        ]);
  }
}
