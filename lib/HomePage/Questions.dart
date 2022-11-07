import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_ordinator/HomePage/homePage.dart';
import 'package:co_ordinator/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../patients/patients.dart';
import 'NavBar.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int selsctedIconIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Can-cer Vive",
          style: TextStyle(
              color: Colors.yellow
          ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.grey
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: GestureDetector(
              onTap: (){
                launch('https://docs.google.com/forms/d/e/1FAIpQLScaiWn8XAAtv7esuAMDZLfhWgNcpSJRUxypheHrx74g55vDYQ/viewform?usp=sf_link');
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Fatigue Questionaires',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),
                  ],
                ),
                height: 100,
                width: MediaQuery.of(context).size.width,
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
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: GestureDetector(
              onTap: (){
                launch('https://docs.google.com/forms/d/e/1FAIpQLScxDp6SJ5mJ5by3VK_AwwO9FaYM0nqgDjaKKvHhgK4_hT2TRA/viewform?usp=sf_link');

              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('QLQ C30 Questionaires',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),
                  ],
                ),
                height: 100,
                width: MediaQuery.of(context).size.width,
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
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: GestureDetector(
              onTap: (){
                launch('https://forms.gle/R5mQffKQUwfQodtk9');

              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HN43 Questionaires',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),
                  ],
                ),
                height: 100,
                width: MediaQuery.of(context).size.width,
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
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: GestureDetector(
              onTap: (){
                launch('https://forms.gle/qCps9f9bt7MTqwU17');

              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('BR45 Questionaires',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),
                  ],
                ),
                height: 100,
                width: MediaQuery.of(context).size.width,
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
        ],
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  HomePage()));

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
              //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  WorkoutsPage()));
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
