import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/searchBar_widget.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';

class ProjectTypeSelection extends StatelessWidget {
  final TextEditingController _searchController = new TextEditingController();

  void searchOperation(String searchText) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            title: Text("Select Project Type"),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SearchBarWidget(_searchController.text, searchOperation),
              // SizedBox(
              //   height: 10,
              // ),

              _typeOptions(context, Type.Business),
              _typeOptions(context, Type.Educational),
              _typeOptions(context, Type.Improvement),
              _typeOptions(context, Type.Medical),
              _typeOptions(context, Type.Personal),
              _typeOptions(context, Type.Technical),
              _typeOptions(context, Type.ProductProduction),
              _typeOptions(context, Type.ServiceProduction),
              _typeOptions(context, Type.Others),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _typeOptions(BuildContext ctx, Type t) {
    final projectProvider = Provider.of<Projects>(ctx);

    return InkWell(
      onTap: () {
        // to pass the selected option (status) to previous page
        projectProvider.setPType(t);
        Navigator.pop(ctx, t);
        print(t.toString());
      },
      child: Card(
        child: ListTile(
          title: Text(
            typeMap[t]['text'],
          ),
        ),
      ),
    );
  }
}
