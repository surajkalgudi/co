
import 'package:co_ordinator/HomePage/Questions.dart';
import 'package:co_ordinator/patients/PatientsDetails.dart';
import 'package:co_ordinator/settings/settings_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../HomePage/NavBar.dart';
import '../HomePage/homePage.dart';

class Patients extends StatefulWidget {
  const Patients({Key? key}) : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  late Query _display;
  int selsctedIconIndex = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _display = FirebaseDatabase.instance.ref().child('Patients').orderByChild('name');
  }

  Widget _Patients({Map? patients}){
    return Container(
      decoration: BoxDecoration(
          color: Colors.lightBlue[100],
          borderRadius: BorderRadius.circular(30)
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 80,
      child:  ListTile(
        onTap: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PatientDetails(
                UHID: patients!['UHID'],
                name: patients['name'],
                age:patients['age'],
                martialStatus:patients['martial status'],
                children:patients['children'],
                gender:patients['gender'],
                stage:patients['Stage'],
                treatmentPlan:patients['Treatment Plan'],
                comorbidities:patients['Comorbidities'],
                history:patients['History'],
                social:patients['Social History'],
                family:patients['Family History'],
                phno: patients["phoneNo"],
                address: patients["address"],
                doctor: patients["doctor"],
                hospital: patients["hopsital"],
                cancertype: patients["canerType"],
              )));
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
          defaultChild:  const Center(
            child:  CircularProgressIndicator(
              value: 0.8,
              strokeWidth: 10,
            ),
          ),
          query:_display ,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
            Map? patients =  snapshot.value as Map?;
            return _Patients(patients: patients);
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        index: selsctedIconIndex,
        height: 60.0,
        onTap: (index) {
          selsctedIconIndex = index;
        },
        animationDuration: Duration(
          milliseconds: 200,
        ),
        items: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  SettingsScreen()));
            },
            child: Icon(Icons.settings, size: 25
                ,color: Colors.black54),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.home, size: 25,
                color: Colors.black54),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  Patients()));
            },
            child: Icon(Icons.people, size: 25,
                color: Colors.black54),
          ),

          GestureDetector(
            onTap: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  Questions()));
            },
            child: Icon(Icons.chat, size: 25,
                color: Colors.black54),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,

        animationCurve: Curves.easeInOut,
      ),
    );
  }
}