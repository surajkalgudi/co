import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 //snapshot = await ref.child("Patients/${widget.UHID}/name").get(); // important

class PatientDetails extends StatefulWidget  {
  var UHID, name, phno , address, doctor, hospital,cancertype ;
  PatientDetails({Key? key, required this.UHID,  this.name,  this.phno,  this.address,  this.doctor,  this.hospital,  this.cancertype}) : super(key: key);


  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  final auth=FirebaseAuth.instance;
  final ref=FirebaseDatabase.instance.ref();
  late final snapshot;



  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(title: const Text('Details'),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(30)
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.name.toString().toUpperCase() + " DETAILS", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
                  Text("Name: " + widget.name, style: TextStyle(fontSize: 20),),
                  Text("Uhid: " + widget.UHID, style: TextStyle(fontSize: 20),),
                  Text("Phone Number: " + widget.phno, style: TextStyle(fontSize: 20),),
                  Text("Address: " + widget.address, style: TextStyle(fontSize: 20),),
                  Text("Doctor: " + widget.doctor, style: TextStyle(fontSize: 20),),
                  Text("Hospital: " + widget.hospital, style: TextStyle(fontSize: 20),),
                  Text("Cancer Type: " + widget.cancertype, style: TextStyle(fontSize: 20),),

                ],
              ),
            )
        ),
      )
    );

  }
}

