import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';

class NameInputCard extends StatefulWidget {
  final String pTitle;
  //  BuildContext context;
  NameInputCard(this.pTitle);
  @override
  _NameInputCardState createState() => _NameInputCardState();
}

class _NameInputCardState extends State<NameInputCard> {
  TextEditingController _ptitleController = TextEditingController();
  bool _validate = false;
  @override
  void initState() {
    _ptitleController.text = widget.pTitle;
    super.initState();
  }

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
              //we assign the value in controller rether than initialValue beacouse we use TextField 
              //inested of TextFormField where TextField have not initialValue proprety
              controller: _ptitleController,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              cursorColor: Colors.indigoAccent,
              // initialValue: widget.pTitle,
              onChanged: (changv) {
                projectProvider.setPtitle(changv);
                setState(() {
                  _ptitleController.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                });
              },
              onSubmitted: (vSubmit) {
                projectProvider.setPtitle(vSubmit);
                setState(() {
                  _ptitleController.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                });
              },

              decoration: InputDecoration(
                errorText: _validate ? 'project name is required' : null,
              ),
            ),
          ),
        ]);
  }
}
