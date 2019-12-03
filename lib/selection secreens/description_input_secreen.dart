import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/projects_provider.dart';

class DescriptionInput extends StatefulWidget {
  final String desc ;
  DescriptionInput(this.desc);

  static const routeName = 'description-input-secreen';
  @override
  _DescriptionInputState createState() => _DescriptionInputState();
}

class _DescriptionInputState extends State<DescriptionInput> {
  
   TextEditingController _descriptionFieldController =  TextEditingController();


  @override
  
  Widget build(BuildContext context) {
      // final projectDesc= ModalRoute.of(context).settings.arguments as String;
        final projectProvider = Provider.of<Projects>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            title: Text("Select Project Status"),
            actions: <Widget>[
              IconButton(icon: const Icon(Icons.save, color: Colors.white,),
          tooltip: 'save dascrition',
          onPressed: ()async {
            print(_descriptionFieldController.text);
            Navigator.pop(context,_descriptionFieldController.text);
            // if (widget.desc== null){
            //   Navigator.pop(context,_descriptionFieldController.text);

            // } else Navigator.pop(context,widget.desc);
            
          },)
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                    left: 40,
                    right: 40,
                    bottom: 10,
                  ),
                  child: 
                  // widget.desc ==null ?
                  TextFormField(
                    controller: _descriptionFieldController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    maxLines: 30,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    cursorColor: Colors.indigoAccent,
                    showCursor:true,
                    obscureText:false,
                    // initialValue: widget.desc,
                    
                    decoration: InputDecoration(
                      labelText: "Enter Project Description .....",
                      border: InputBorder.none,
                    ),
                     onChanged: (vChanged) => projectProvider.setpDescription(vChanged),
                    
                  )
                  // :TextFormField(
                  //    textInputAction: TextInputAction.done,
                  //   keyboardType: TextInputType.multiline,
                  //   maxLines: 30,
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  //   cursorColor: Colors.indigoAccent,
                  //   showCursor:true,
                  //   obscureText:false,
                  //   initialValue: widget.desc,
                  //   decoration: InputDecoration(
                  //     labelText: "Enter Project Description .....",
                  //     border: InputBorder.none,
                  //   ),
                  // )
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
