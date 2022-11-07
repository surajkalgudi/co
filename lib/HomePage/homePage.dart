import 'package:co_ordinator/DisplayPatients.dart';
import 'package:co_ordinator/HomePage/Questions.dart';
import 'package:co_ordinator/patients/patients.dart';
import 'package:co_ordinator/patients/search.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../patients/CreatePatients.dart';
import '../patients/PatientsDetails.dart';
import '../settings/settings_screen.dart';
import 'NavBar.dart';

class HomePage extends StatelessWidget {
  final searchController = TextEditingController();
  String id='/';
  int day=1;
  int selsctedIconIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Can-cer vive',
          style: TextStyle(
              color: Colors.amber
          ),),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,
                color: Colors.black,),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bolt,
              color: Colors.yellow,),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
            child: Text(
              '$day Days',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
          ),
        ],
      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 15,
                          ),
                          Text('Hello,',
                            style: TextStyle(
                                fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('Co-ordinator',
                            style: TextStyle(
                                fontSize: 30
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 17, 10),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEFEFEF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    ),
                    hintText: "Search for patients",
                    suffixIcon: IconButton( onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search(UHID: searchController.text )));
                      print( searchController.text);
                    }, icon: const Icon(Icons.search),),
                    prefixIconColor: Colors.black
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Profiles',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                   MaterialPageRoute(builder: (context) => createPatient()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 25, 10, 4),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                      'assets/images/pat3.png'
                                  ),
                                ),
                              ),
                              Text('Add new Patients',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),)

                            ],
                          ),
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:  Colors.white,
                              boxShadow: [new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                              ),]
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const  EdgeInsets.fromLTRB(5, 0, 10, 0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DisplayPatients()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 25, 10, 4),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                      'assets/images/p2.jpg'
                                  ),
                                ),
                              ),
                              Text('Update Patients',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white
                                ),)
                            ],

                          ),
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:  Colors.lightBlueAccent[200],
                              // boxShadow: [new BoxShadow(
                              //   color: Color(0xff918fa5),
                              //   blurRadius: 10.0,
                              // ),]
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: GestureDetector(
                  onTap: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => PatientDetails()));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Patient\'s Attendance',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                              'assets/images/patient.jpg'
                          ),
                        ),
                      ],
                    ),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        )
                        ]
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Appointment Today',
                      style:TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: AppointmentCard(
                  onTap: (){

                  },
                ),
              ),
            ]
        ),
      ),
      backgroundColor: Colors.white,
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.deepPurple,
      //   animationDuration:Duration(milliseconds: 300),
      //   items: [
      //     Icon(Icons.settings),
      //     Icon(Icons.home),
      //     Icon(Icons.people),
      //     Icon(Icons.chat),
      //   ],
      // ),
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

            },
            child: Icon(Icons.home, size: 25,
                color: Colors.black54),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) =>  Patients()));
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
class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/p2.jpg'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Patient: Mukesh',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'consultation',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ScheduleCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.deepPurple[400],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple[300],
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Mon, July 29',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


