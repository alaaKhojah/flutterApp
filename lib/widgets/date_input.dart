import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';

class DateInputCard extends StatefulWidget {
  // final DateTime sDate;
  // final DateTime dDate;
  // DateInputCard(this.sDate, this.dDate);
  @override
  _DateInputCardState createState() => _DateInputCardState();
}

class _DateInputCardState extends State<DateInputCard> {
   final format = DateFormat("yyyy-MM-dd");

  DateTime _selectedStartDate;

  DateTime _selectedSDueDate;
  final _dueDateFocusNode = FocusNode();
// you have to dispose when state clear , so when this object get
//removed, when you'll leave that secreen because these focuse nodes
// otherwise will stick around in memory and will lead to memory leak.
@override
  void dispose() {
    _dueDateFocusNode.dispose();
    super.dispose();
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
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 10.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.date_range,
                  size: 30,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  width: 7.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Project Date",
                    style:
                         Theme.of(context).textTheme.body1,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 16),
                child:
                    //  TextFormField(
                    //   decoration: InputDecoration(labelText: "Start Date"),
                    // ),
                    DateTimeField(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(labelText: "Start date"),
                  format: format,
                  onChanged: (date) => setState(() {
                    _selectedStartDate = date;
                    projectProvider.setPStartDate(date);
                  }),
                  onShowPicker: (context, currentValue) async {
                    final datee = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2019),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: _selectedSDueDate ?? DateTime(2030),
                    );
                    return datee;
                  },
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_){
                    FocusScope.of(context).requestFocus(_dueDateFocusNode);
                  },
                
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 20),
                child: DateTimeField(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(labelText: "Due date"),
                  format: format,
                  onChanged: (due) => setState(() {
                    _selectedSDueDate = due;
                   projectProvider.setPDueDate(due);
                  }),
                  initialValue: _selectedStartDate,
                  onShowPicker: (context, currentValue1) async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: _selectedStartDate ?? DateTime(2019),
                      initialDate:
                          _selectedStartDate ?? currentValue1 ?? DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    return date;
                  },
                  keyboardType: TextInputType.datetime,
                  focusNode: _dueDateFocusNode,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ]);
  }
}