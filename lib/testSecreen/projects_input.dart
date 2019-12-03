import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class ProjectInputs extends StatefulWidget {
  @override
  _ProjectInputsState createState() => _ProjectInputsState();
}

class _ProjectInputsState extends State<ProjectInputs> {
  final format = DateFormat("yyyy-MM-dd");
  DateTime _selectedStartDate;
  DateTime _selectedSDueDate;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                cursorColor: Colors.indigoAccent,
                decoration: InputDecoration(
                  icon: Icon(Icons.title, color: Colors.indigoAccent),
                  labelText: "Project Title",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  icon: Icon(Icons.description, color: Colors.indigoAccent),
                  labelText: "description",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Colors.indigoAccent),
                  labelText: "Project Manager",
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(Icons.date_range, color: Colors.indigoAccent),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child:
                        //  TextFormField(
                        //   decoration: InputDecoration(labelText: "Start Date"),
                        // ),
                        DateTimeField(
                      decoration: InputDecoration(labelText: "Start date"),
                      format: format,
                      onChanged: (date) => setState(() {
                        _selectedStartDate = date;
                      }),
                      onShowPicker: (context, currentValue) async {
                        final datee = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2019),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: _selectedSDueDate ?? DateTime(2030),
                        );
                        return datee;
                        // .then((pickedStartDate){
                        //   if(pickedStartDate==null){
                        //     return;
                        //   }
                        //   setState(() {
                        //     _selectedStartDate= pickedStartDate;
                        //   });
                        // });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: DateTimeField(
                      decoration: InputDecoration(labelText: "Due date"),
                      format: format,
                      onChanged: (due) => setState(() {
                        _selectedSDueDate = due;
                      }),
                      initialValue: _selectedStartDate,
                      onShowPicker: (context, currentValue1) async {
                        final date = await showDatePicker(
                          context: context,
                          firstDate: _selectedStartDate ?? DateTime(2019),
                          initialDate: _selectedStartDate ??
                              currentValue1 ??
                              DateTime.now(),
                          lastDate: DateTime(2030),
                        );
                        return date;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.merge_type, color: Colors.indigoAccent),
                  labelText: "Project Type",
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
                child: DropdownButtonFormField(
                  hint: Text("select Project Status"),
                  decoration: InputDecoration(
                    icon: Icon(Icons.group_work, color: Colors.indigoAccent),
                    // border: InputBorder.none,
                  ),
                )
                
                ),
          ],
        ),
      ),
    );
  }
}
