import 'package:flutter/material.dart';


class SearchBarWidget extends StatefulWidget {
 final String searchText;
  final Function searchOperation;
  SearchBarWidget(this.searchText, this.searchOperation);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  // final TextEditingController searchTextController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          child: TextField(
            // controller: searchTextController,
            

            onChanged: widget.searchOperation,

            // style: dropDownMenuItemStyle,
            cursorColor: Colors.indigoAccent,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 14.0),
              hintText: "Search Project",
              suffixIcon: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    color: Colors.indigoAccent,
                  ),
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
