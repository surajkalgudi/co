import 'package:co_ordinator/patients/components.dart';
import 'package:co_ordinator/patients/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdatePatients extends StatefulWidget {
  var UHID;
   UpdatePatients({Key? key, required this.UHID}) : super(key: key);

  @override
  State<UpdatePatients> createState() => _UpdatePatientsState();
}

class _UpdatePatientsState extends State<UpdatePatients> {
  final controllerSPO2 = TextEditingController();
  final controllerBloodPressure = TextEditingController();
  final controllerHb = TextEditingController();
  final controllerHeight = TextEditingController();
  final controllerWeight = TextEditingController();
  final controllerBMI = TextEditingController();
  final controllerHands = TextEditingController();
  final controllerLegs = TextEditingController();
  final controllerFatHands = TextEditingController();
  final controllerFatLegs = TextEditingController();
  final controllerFatTrunk = TextEditingController();
  final controllerTrunk = TextEditingController();
  final controllerStrengthUpperLimb = TextEditingController();
  final controllerStrengthLowerLimb = TextEditingController();
  final controllerEnduranceUpperLimb = TextEditingController();
  final controllerEnduranceLowerLimb = TextEditingController();
  final controllerRBC = TextEditingController();
  final controllerNeutophil = TextEditingController();
  final controllerEosinophil = TextEditingController();
  final controllerLymphocyte = TextEditingController();
  final controllerBasophil = TextEditingController();
  final controllerMonocyte = TextEditingController();
  final controllerHctPvc = TextEditingController();
  final controllerAlbumin = TextEditingController();
  final controllerGlobulin = TextEditingController();
  final controllerCreatinine = TextEditingController();
  final controllerUrea = TextEditingController();
  final controllerDischarge = TextEditingController();
  final controllerUHID = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Patients');
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage=Storage();
    String date = DateFormat.yMMMMd('en_US').format(DateTime.now());
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Text(
              "Update Patients Informations",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Components(controllerText: controllerSPO2, displayText: "SpO2"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerBloodPressure,
                displayText: "Blood Pressure"),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerHb, displayText: "Hb%"),
            SizedBox(
              height: 24,
            ),

            Text(
              "Body Composition:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerHeight, displayText: "Height"),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerWeight, displayText: "Weight"),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerBMI, displayText: "BMI"),
            SizedBox(
              height: 24,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Subcutaneous fat:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Components(
                controllerText: controllerFatTrunk, displayText: "Trunk"),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerFatLegs, displayText: "Legs"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerFatHands, displayText: "Hands"),
            SizedBox(
              height: 24,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Skeletal Muscle:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerTrunk, displayText: "Trunk"),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerLegs, displayText: "Legs"),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerHands, displayText: "Hands"),
            SizedBox(
              height: 24,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Strength parameters",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerStrengthUpperLimb,
                displayText: "Upper Limb"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerStrengthLowerLimb,
                displayText: "Lower Limb"),
            SizedBox(
              height: 24,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Endurance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerEnduranceUpperLimb,
                displayText: "Upper Limb"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerEnduranceLowerLimb,
                displayText: "Lower Limb"),
            SizedBox(
              height: 24,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Blood parameters: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerRBC, displayText: "RBC count"),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "WBC count:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerNeutophil, displayText: "Neutrophil"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerEosinophil,
                displayText: "Eosinophil"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerLymphocyte,
                displayText: "Lymphocyte"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerBasophil, displayText: "Basophil"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerMonocyte, displayText: "Monocyte"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerHctPvc, displayText: "HCT/PVC"),
            SizedBox(
              height: 24,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Liver Test",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerAlbumin, displayText: "Albumin"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerGlobulin, displayText: "Globulin"),
            SizedBox(
              height: 24,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Kidney Test",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerCreatinine,
                displayText: "Creatinine"),
            SizedBox(
              height: 24,
            ),

            Components(controllerText: controllerUrea, displayText: "Urea"),
            SizedBox(
              height: 24,
            ),

            Components(
                controllerText: controllerDischarge,
                displayText: "Discharge Date"),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[200],
                ),
                onPressed: () async {
                  final results=await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.custom,
                    allowedExtensions: ['png','jpg'],
                  );

                  BorderRadius.circular(20);
                  if(results==null){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No file Selected.')));
                  }
                  final path=results?.files.single.path!;
                  final fileName=results?.files.single.name;


                  print(path);
                  print(fileName);
                  storage.uploadFile(path!, fileName!).then((value) => print('Done'));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upload Files",
                      style: TextStyle(
                          color: Colors.grey[600]
                      ),),
                    Icon(Icons.attach_file,
                      color: Colors.grey[600],),

                  ],
                )),
            SizedBox(
              height: 24,
            ),

            ElevatedButton(

                onPressed: () {

                  // Map<String, String> update = new Map();
                  //TODO in that first child UHID of the current patient haku
                  dbRef.child(widget.UHID).child("Sessions").set({
                    "Session $date": {
                      'SpO2': controllerSPO2.text,
                      'Blood Pressure': controllerBloodPressure.text,
                      'haemoglobin': controllerHb.text,
                      'Height': controllerHeight.text,
                      'Weight': controllerWeight.text,
                      'BMI': controllerBMI.text,
                      'Subcutaneous fat-Trunk': controllerFatTrunk.text,
                      'Subcutaneous fat-Hands': controllerFatHands.text,
                      'Subcutaneous fat-Legs': controllerFatLegs.text,
                      'Skeletal Muscle-Trunk': controllerTrunk.text,
                      'Skeletal Muscle-Hands': controllerHands.text,
                      'Skeletal Muscle-Legs': controllerLegs.text,
                      'Strength parameters Upper-Limb':
                          controllerStrengthUpperLimb.text,
                      'Strength parameters Lower-Limb':
                          controllerStrengthLowerLimb.text,
                      'Endurance Upper-Limb': controllerEnduranceUpperLimb.text,
                      'Endurance Upper-Limb': controllerEnduranceLowerLimb.text,
                      'RBC': controllerRBC.text,
                      'Neutrinophil': controllerNeutophil.text,
                      'Eosinophil': controllerEosinophil.text,
                      'Lymphocytes': controllerLymphocyte.text,
                      'Basophil': controllerBasophil.text,
                      'Monocyte': controllerMonocyte.text,
                      'HCR-PCV': controllerHctPvc.text,
                      'Albumin': controllerAlbumin.text,
                      'Globulin': controllerGlobulin.text,
                      'Creatinine': controllerCreatinine.text,
                      'Urea': controllerUrea.text,
                      'Discharge Details': controllerDischarge.text
                    }
                  });

                  Navigator.pop(context);
                },
                child: Text('Upload'))
          ],
        ),
      ),
    );
  }
}
