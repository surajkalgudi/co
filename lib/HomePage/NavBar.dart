import 'package:co_ordinator/LoginPage/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Questions.dart';

class NavBar extends StatefulWidget {
  String id='/Nav';
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final auth=FirebaseAuth.instance;


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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
                    auth.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));

          });
        },
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
              Icons.add
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xff1f005c),
                    Color(0xff5b0060),
                    Color(0xff870160),
                    Color(0xffac255e),
                    Color(0xffca485c),
                    Color(0xffe16b5c),
                    Color(0xfff39060),
                    Color(0xffffb56b),
                  ],)),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex:5,
                child:Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xff1f005c),
                        Color(0xff5b0060),
                        Color(0xff870160),
                        Color(0xffac255e),
                        Color(0xffca485c),
                        Color(0xffe16b5c),
                        Color(0xfff39060),
                        Color(0xffffb56b),
                      ],
                    ),
                  ),
                  child: Column(
                      children: [
                        SizedBox(height: 110.0,),
                        CircleAvatar(
                          radius: 65.0,
                          backgroundImage: AssetImage('assets/erza.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: 10.0,),
                        Text('',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 20.0,
                            )),
                        SizedBox(height: 10.0,),
                        Text('Co-ordinator',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 15.0,
                          ),)
                      ]
                  ),
                ),
              ),
              

              Expanded(
                flex:5,
                child: Container(),
                // child: InkWell(
                //     child: Card(
                //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                //       child: ListTile(
                //         leading: Icon(
                //           Icons.phone,
                //           color: Colors.teal,
                //         ),
                //         title: Text(
                //           '+229 96119149',
                //           style: TextStyle(
                //               fontFamily: 'SourceSansPro',
                //               fontSize: 20,
                //               color: Colors.teal.shade900),
                //         ),
                //       ),
                //
                //     ),
                //     onTap: (){
                //       // _launchURL('tel:+229 96119149');
                //     }
                // ),

              ),


            ],
          ),
          Positioned(
              top:MediaQuery.of(context).size.height*0.47,
              left: 50.0,
              right: 50.0,
              child: Card(
                  child: Padding(
                    padding:EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Questions()));

                          },
                          child: Container(
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(

                                    children: [
                                      Center(child: Text("Questionaires",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,

                                        fontSize: 20
                                      ),)),
                                    ],
                                  )
                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  )
              )
          ),
          Positioned(
              top:MediaQuery.of(context).size.height*0.35,
              left: 20.0,
              right: 20.0,
              child: Card(
                  child: Padding(
                    padding:EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(

                                  children: [
                                    Center(child: Text("BGS Hospital",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 10,
                                          fontSize: 20
                                      ),)),
                                  ],
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  )
              )
          )
        ],
      ),
    );
  }
}

