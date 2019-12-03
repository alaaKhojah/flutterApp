import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/searchBar_widget.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';

class ProjectStatusSelection extends StatelessWidget {
  final TextEditingController _searchController = new TextEditingController();

  void searchOperation(String searchText) {}
//  Status _selectedOption;

//   _option(Status c) async {
//     setState(() {
//       _selectedOption = c;
//       print(_selectedOption);
//        Navigator.pop(context,_selectedOption);
//     });
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            title: Text("Select Project Status"),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SearchBarWidget(_searchController.text, searchOperation),
              _statusOptions(context, Status.Open),
              _statusOptions(context, Status.InProgress),
              _statusOptions(context, Status.Hold),
              _statusOptions(context, Status.Executed),
              _statusOptions(context, Status.Cancelled),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget _statusOptions(BuildContext ctx, Status c) {
  final projectProvider = Provider.of<Projects>(ctx);

  return InkWell(
    onTap: () {
      projectProvider.setPStatus(c);
      // to pass the selected option (status) to previous page
      Navigator.pop(ctx, c);
      print(c);
    },
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white30,
          radius: 20,
          child: FittedBox(
            child: Icon(
              resultsMap[c]['icons'],
              color: resultsMap[c]['color'],
            ),
          ),
        ),
        title: Text(
          resultsMap[c]['text'],
        ),
      ),
    ),
  );
}
