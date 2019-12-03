import 'package:flutter/material.dart';
import '../widgets/ticketClipper.dart';

class CardBox extends StatefulWidget{
  final double height ;

  final  Widget cardContent;
   CardBox(this.height, this.cardContent);
  @override
  _CardBoxState createState() => _CardBoxState();
}

class _CardBoxState extends State<CardBox> {
   


  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
    child: ClipPath(
      clipper: TicketClipper(10.0),
      child: Material(
        elevation: 0.0,
        shadowColor: Color(0x30E5E5E5),
        color: Colors.transparent,
        child: ClipPath(
          clipper: TicketClipper(12.0),
          child: Card(
            elevation: 0.0,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            margin: const EdgeInsets.all(2.0),
            child: Container(
              color: Colors.indigo[50],
              height: widget.height,
              child: widget.cardContent,
            ),
          ),
        ),
      ),
    ),
  );
  }
}