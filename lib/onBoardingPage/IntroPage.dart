import 'dart:async';
import 'package:co_ordinator/onBoardingPage/OnBoardingPage.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  String id='/IntroPage';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 5), openOnBoard);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/logo4.png',

                ),
                scale:.1
            ),
          ),
        ),
      ),
    );
  }
  void openOnBoard()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OnboardingScreen()));
  }
}
