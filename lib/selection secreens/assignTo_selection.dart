import 'package:flutter/material.dart';
import '../models/dummy_maneger.dart';
import '../widgets/searchBar_widget.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';

class AssignToSelection extends StatefulWidget {
  // final String pManager;
  // AssignToSelection(this.pManager);
  static const routeName = 'assignTo-selection';
  @override
  _AssignToSelectionState createState() => _AssignToSelectionState();
}

class _AssignToSelectionState extends State<AssignToSelection> {
  final TextEditingController _searchController = new TextEditingController();

  List<Manager> searchresult =  List();
  void searchOperation(String searchText) {
    searchresult.clear();
    if (searchText.isEmpty) {
      setState(() {});
      return;
    }
    dummyManagers.forEach((allproject) {
      if (allproject.managerName.toLowerCase().contains(searchText) ||
          allproject.managerName.toLowerCase().startsWith(searchText))
        searchresult.add(allproject);
    });
    setState(() {});
  }


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
              SafeArea(
                child: Container(
                    height: 500,
                    child: searchresult.length != 0 ||
                            _searchController.text.isNotEmpty
                        ?  _searchResultList(searchresult)
                        :_allManagerListBuilder(),
                        ) ,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget _allManagerListBuilder() {
  return ListView.builder(
    itemCount: dummyManagers.length,
    itemBuilder: (ctx, i) => ManagerInfo(
      dummyManagers[i].managerId,
      dummyManagers[i].managerName,
      dummyManagers[i].managerAvatar,
      dummyManagers[i].managerPostion,
    ),
  );
}

Widget _searchResultList(List<Manager> searchresult) {
  return ListView.builder(
    itemCount: searchresult.length,
    itemBuilder: (ctx, i) => ManagerInfo(
      searchresult[i].managerId,
      searchresult[i].managerName,
      searchresult[i].managerAvatar,
      searchresult[i].managerPostion,
    ),
  );
}

class ManagerInfo extends StatelessWidget {
  final String id;
  final String name;
  final String avatar;
  final String position;
  ManagerInfo(this.id, this.name, this.avatar, this.position);
  @override
  Widget build(BuildContext context) {
        final projectProvider = Provider.of<Projects>(context);

    return InkWell(
      //when click in on manager the (pop) will take the clicked manage id and sened to the previous page
      onTap: () {
       
        projectProvider.setManager(Manager(managerId: id , managerName: name, managerAvatar: avatar, managerPostion: position));
        Navigator.pop(context, id);
        print(id);
        
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(avatar),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.body1,
          ),
          subtitle: Text(position),
        ),
      ),
    );
  }
}
