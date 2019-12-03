import 'package:flutter/material.dart';
import '../selection secreens/description_input_secreen.dart';

class DescriptionInputCard extends StatefulWidget {
  //  String descriptionFieldController;
  // DescriptionInputCard(this.descriptionFieldController);
  @override
  _DescriptionInputCardState createState() => _DescriptionInputCardState();
}

class _DescriptionInputCardState extends State<DescriptionInputCard> {
  String descriptionFieldController;

  awaitReturnValueFromDescriptionInputScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    String descriptionResult = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DescriptionInput(descriptionFieldController), // كنت حطيت الارقمنت عشان ابغى اطبع القيمه في المدخله في الصفحه الثانيع عن طريق الانيشيل فاليو
        ));
    setState(() {
      descriptionFieldController = descriptionResult;
    });
  }

  @override
  Widget build(BuildContext context) {

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
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    awaitReturnValueFromDescriptionInputScreen(context);
                  },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          Icons.description,
                          size: 30,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Project Description",
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 30,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Expanded(
          //   child: Container(),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              bottom: 10,
            ),
            child: descriptionFieldController == null
                ? TextFormField(
                    onTap: () {
                      awaitReturnValueFromDescriptionInputScreen(context);
                    },
                    keyboardType: TextInputType.multiline,
                    initialValue: descriptionFieldController,
                    maxLines: 4,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    cursorColor: Colors.indigoAccent,
                    decoration: InputDecoration(
                        hintText: "project description....",
                        border: InputBorder.none),
                    
                  )
                : TextFormField(
                  
                    onTap: () {
                      awaitReturnValueFromDescriptionInputScreen(context);
                      // Navigator.of(context).pushNamed(
                      //   DescriptionInput.routeName,
                      //   arguments: descriptionFieldController,
                      // );
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionInput(descriptionFieldController)));
                    },
                    keyboardType: TextInputType.multiline,
                    initialValue: descriptionFieldController,
                    maxLines: 4,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    cursorColor: Colors.indigoAccent,
                    decoration: InputDecoration(
                        hintText: descriptionFieldController,
                        border: InputBorder.none),
                    textInputAction: TextInputAction.done,
                  ),
          ),
        ]);
  }
}
