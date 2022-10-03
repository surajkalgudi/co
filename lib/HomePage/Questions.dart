import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
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
    );
  }
}
