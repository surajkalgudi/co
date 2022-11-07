import 'package:co_ordinator/patients/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class createPatient extends StatefulWidget {
  @override
  State<createPatient> createState() => _createPatientState();
}

class _createPatientState extends State<createPatient> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerMartialStatus = TextEditingController();
  final controllerChildren = TextEditingController();
  late final controllerGender = TextEditingController();
  final controllerHospital = TextEditingController();
  final controllerDoctor = TextEditingController();
  final controllerUHID = TextEditingController();
  final controllerPhoneNo = TextEditingController();
  final controllerCanerType = TextEditingController();
  final controllerStage = TextEditingController();
  final controllerTreatmentPlan = TextEditingController();
  final controllerComorbidities = TextEditingController();
  final controllerHistory = TextEditingController();
  final controllerSocialHistory = TextEditingController();
  final controllerFamilyHistory = TextEditingController();
  final controllerAddress = TextEditingController();
  final controllerPass = TextEditingController();

  late String _dropDownValue = "";
  late String _dropDown="";

  late DatabaseReference dbRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Patients');
  }

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
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
              "Add New Patients:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      suffixIcon: Icon(Icons.person),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerAge,
                  decoration: InputDecoration(
                      labelText: 'Age',
                      suffixIcon: Icon(Icons.numbers),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: DropdownButton(

                  hint: _dropDown.isEmpty
                      ? const Text('Marital Status',style: TextStyle(color: Color(0xff5A5A5A),fontSize: 15),)
                      : Text(
                    _dropDown,
                    style: TextStyle(color: Colors.blue),
                  ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.grey[600]),
                  items: ['Single', 'Married', 'Divorced', 'Widowed'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                        _dropDown = val as String;
                        //controllerGender=_dropDownValue;
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.grey[200],
            //       border: Border.all(color: Colors.white),
            //       borderRadius: BorderRadius.circular(12)),
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
            //     child: TextField(
            //       controller: controllerHistory,
            //       decoration: InputDecoration(
            //           labelText: 'Marital Status',
            //           //suffixIcon: Icon(Icons.type_specimen),
            //           // hintText: 'Password',
            //           border: InputBorder.none),
            //     ),
            //   ),
            // ),
            //
            // //TODO dicvoureced and awinndowed and maqriied
            // //TODO gender
            // SizedBox(
            //   height: 24,
            // ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerChildren,
                  decoration: InputDecoration(
                      labelText: 'Children',
                      //suffixIcon: Icon(Icons.type_specimen),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: DropdownButton(

                  hint: _dropDownValue.isEmpty
                      ? const Text('Gender',style: TextStyle(color: Color(0xff5A5A5A),fontSize: 15),)
                      : Text(
                    _dropDownValue,
                    style: TextStyle(color: Colors.blue),
                  ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.grey[600]),
                  items: ['Male', 'Female', 'Others'].map(
                        (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                          () {
                        _dropDownValue = val as String;
                        //controllerGender=_dropDownValue;
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerHospital,
                  decoration: InputDecoration(
                      labelText: 'Hospital',
                      suffixIcon: Icon(Icons.local_hospital),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerDoctor,
                  decoration: InputDecoration(
                      labelText: 'Doctor',
                      suffixIcon: Icon(Icons.person),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerUHID,
                  decoration: InputDecoration(
                      labelText: 'UHID',
                      suffixIcon: Icon(Icons.numbers),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerPhoneNo,
                  decoration: InputDecoration(
                      labelText: 'Phone No.',
                      suffixIcon: Icon(Icons.mobile_friendly),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerCanerType,
                  decoration: InputDecoration(
                      labelText: 'Cancer Type',
                      //suffixIcon: Icon(Icons.type_specimen),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerStage,
                  decoration: InputDecoration(
                      labelText: 'Stage',
                      //suffixIcon: Icon(Icons.type_specimen),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerTreatmentPlan,
                  decoration: InputDecoration(
                      labelText: 'Treatment Plan',
                      //suffixIcon: Icon(Icons.type_specimen),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerComorbidities,
                  decoration: InputDecoration(
                      labelText: 'Comorbidities',
                      //suffixIcon: Icon(Icons.type_specimen),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),





            Container(
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerHistory,
                  decoration: InputDecoration(
                      labelText: 'History',
                      //suffixIcon: Icon(Icons.type_specimen),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerSocialHistory,
                  decoration: InputDecoration(
                      labelText: 'Social History',
                      //suffixIcon: Icon(Icons.type_specimen),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerFamilyHistory,
                  decoration: InputDecoration(
                      labelText: 'Family History',
                      //suffixIcon: Icon(Icons.type_specimen),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
                child: TextField(
                  controller: controllerAddress,
                  decoration: InputDecoration(
                      labelText: 'Address',
                      suffixIcon: Icon(Icons.location_city),
                      // hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[200],
                ),
                onPressed: () async {
                  final results = await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpg'],
                  );

                  BorderRadius.circular(20);
                  if (results == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No file Selected.')));
                  }
                  final path = results?.files.single.path!;
                  final fileName = results?.files.single.name;

                  print(path);
                  print(fileName);
                  storage
                      .uploadFile(path!, fileName!)
                      .then((value) => print('Done'));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upload Files ",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Colors.grey[600],
                    ),
                  ],
                )),

            SizedBox(
              height: 24,
            ),
            ElevatedButton(
                //TODO caner => "cancer" ::: hopsital => "hospital"
                onPressed: () {
                  dbRef.child(controllerUHID.text).set({
                    'name': controllerName.text,
                    'age':controllerAge.text,
                     'martial status':_dropDown,
                    'children':controllerChildren.text,
                     'Gender': _dropDownValue,
                    'hopsital': controllerHospital.text,
                    'doctor': controllerDoctor.text,
                    'UHID': controllerUHID.text,
                    'phoneNo': controllerPhoneNo.text,
                    'canerType': controllerCanerType.text,
                    'Stage': controllerCanerType.text,
                    'Treatment Plan': controllerTreatmentPlan.text,
                    'Comorbidities': controllerComorbidities.text,
                    'History': controllerHistory.text,
                    'Social History':controllerSocialHistory.text,
                    'Family History':controllerFamilyHistory.text,
                    'address': controllerAddress.text
                  });
                  Navigator.pop(context);
                },
                child: Text('Create'))
          ],
        ),
      ),
    );
  }
}
