
import 'package:co_ordinator/DisplayPatients.dart';
import 'package:co_ordinator/HomePage/NavBar.dart';
import 'package:co_ordinator/onBoardingPage/IntroPage.dart';
import 'package:co_ordinator/patients/CreatePatients.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'HomePage/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:    isLoggedIn ? HomePage() : IntroPage(),
      // routes:{
      //   '/': (context) =>  HomePage(),
      //   '/IntroPage'
      //   '/create': (context) => createPatient(),
      //   '/update': (context) => DisplayPatients(),
      //   '/Nav':(context)=>NavBar()
      // },
    );
  }
}




