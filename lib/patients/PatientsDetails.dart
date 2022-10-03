import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatefulWidget  {
  var UHID;
  PatientDetails({Key? key, required this.UHID}) : super(key: key);


  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  final auth=FirebaseAuth.instance;

  final ref=FirebaseDatabase.instance.ref('Patients').child('widget.UHID');


  late final snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:
        Column(
          children: [
            // FirebaseAnimatedList(
            //   shrinkWrap: true,
            //     query: ref, itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index){
            //   return ListTile(
            //     title: Text(snapshot.child('name').toString()),
            //
            //   );
            // })
            ElevatedButton(
              onPressed: () async {
                 snapshot = await ref.child(widget.UHID).get();
                if (snapshot.exists) {
                  print(snapshot.value);
                } else {
                  print('No data available.');
                }
              }, child: Text("click me"),
            ),
          ],
        ),
      ),
    );
  }
}

