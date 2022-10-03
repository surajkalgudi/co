import 'package:flutter/material.dart';

class Components extends StatelessWidget {
   TextEditingController controllerText=new TextEditingController();
   String displayText;

  // const ({Key? key}) : super(key: key);
  Components({
  required this.controllerText  ,
    required this.displayText,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
        child: TextField(
          controller: controllerText,
          decoration: InputDecoration(
              labelText: displayText,
              suffixIcon: Icon(Icons.person),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
