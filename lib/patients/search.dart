
import 'package:co_ordinator/patients/PatientsDetails.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../HomePage/NavBar.dart';
import '../HomePage/homePage.dart';



class Search extends StatefulWidget {
  var UHID;
  Search({Key? key, required this.UHID}) : super(key: key);


  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Query _display;
  late Query _session;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _display = FirebaseDatabase.instance.ref().child('Patients');
    _session = FirebaseDatabase.instance.ref().child('Patients').child(widget.UHID).child("Sessions");
  }
  Widget _Patient({Map? patient}){
    return Container(
      decoration: BoxDecoration(
          color: Colors.lightBlue[100],
          borderRadius: BorderRadius.circular(30)
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Session DETAILS", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),
          Text("Sp02: " + patient!['SpO2'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Blood Pressure: " +patient['Blood Pressure'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Hb: " +patient['haemoglobin'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("HbA1c : "+patient['HbA1c'], style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),

          Text("FBS: "+patient['FBS'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),


          Text("PPBS: "+patient['PPBS'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),
          Text("Body Composition", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),
          Text("Height: " + patient['Height'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Weight: " + patient['Weight'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("BMI: " + patient['BMI'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Subcutaneous Fat", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),
          Text("Trunk: " + patient['Subcutaneous fat-Trunk'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Legs: " +patient['Subcutaneous fat-Legs'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Hands: " +patient['Subcutaneous fat-Hands'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Skeletal Muscle", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),
          Text("Trunk: " + patient['Skeletal Muscle-Trunk'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Legs: " +patient['Skeletal Muscle-Legs'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Hands: " +patient['Skeletal Muscle-Hands'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Strength parameters", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),
          Text("Upper Limb: " + patient['Strength parameters Upper-Limb'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Lower Limb: " +patient['Strength parameters Lower-Limb'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("Endurance", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),
          Text("Upper Limb: " + patient['Endurance Upper-Limb'], style: TextStyle(fontSize: 20),),
          // SizedBox(height: 10,),
          // Text("Lower Limb: " +patient['Endurance Lower-Limb'], style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Text("RBC count: "+patient['RBC'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("RBC count: "+patient['WBC'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("Neutrinophil: "+patient['Neutrinophil'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),


          Text("Eosinophil: "+patient['Eosinophil'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("Lymphocyte: "+patient['Lymphocytes'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),


          Text("Basophil: "+patient['Basophil'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("Monocyte: "+patient['Monocyte'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),


          Text("HCT/PVC: "+patient['HCR-PCV'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("Liver Test: ", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),

          Text("Albumin: "+patient['Albumin'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),


          Text("Globulin: "+patient['Globulin'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),


          Text("Kidney Test: ", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),

          Text("Creatinine: "+patient['Creatinine'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),


          Text("Urea: "+patient['Urea'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("Lipid Profile Test", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30),),
          SizedBox(height: 20,),

          Text("Total Cholesterol: "+patient['Total Cholesterol'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("HDL Cholesterol: "+patient['HDL Cholesterol'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("LDL Cholesterol: "+patient['LDL Cholesterol'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("VLDL Cholesterol: "+patient['VLDL Cholesterol'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

          Text("Triglyceride: "+patient['Triglyceride'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),





          Text("Discharge date: "+patient['Discharge Details'], style: TextStyle( fontSize: 20),),
          SizedBox(height: 10,),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Can-cer vive",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body:
          Container(
            padding: EdgeInsets.all(20),
            height: double.infinity,
            child: FirebaseAnimatedList(
              defaultChild:  const Center(
                // child:  CircularProgressIndicator(
                //   value: 0.8,
                //   strokeWidth: 10,
                // ),
              ),
              query:_session ,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                Map? patient =  snapshot.value as Map?;
                return _Patient(patient: patient);

              },
            ),
          ),
    );
  }
}

