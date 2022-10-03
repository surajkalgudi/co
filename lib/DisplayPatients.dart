import 'package:co_ordinator/patients/updatePatients.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayPatients extends StatefulWidget  {
  const DisplayPatients({Key? key}) : super(key: key);
  @override
  State<DisplayPatients> createState() => _DisplayPatientsState();
}
class _DisplayPatientsState extends State<DisplayPatients> {
  late Query _display;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _display = FirebaseDatabase.instance.ref().child('Patients').orderByChild('name');
  }

  Widget _Patients({Map? patients}){
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30)
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 80,
      child:  ListTile(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UpdatePatients(UHID: patients!['UHID'],)));
        },
        leading: const CircleAvatar( backgroundImage: AssetImage('assets/images/p2.jpg'),),
        title: Text(patients!['name']),
        trailing: Text(patients['UHID']),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Can-cer vive",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        child: FirebaseAnimatedList(
          query:_display ,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
            Map? patients =  snapshot.value as Map?;
            return _Patients(patients: patients);
          },
        ),
      ),
    );
  }
}
