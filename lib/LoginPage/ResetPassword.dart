import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPass extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        "Can-cer vive",
        style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.grey),
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Enter your email-id"),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: 'Email', border: InputBorder.none),
                ),
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () async {
                if (_emailController.text == null) {
                  showSnackBar('Please proviide a valid email', context);
                  return;
                }
                if (!_emailController.text.contains('@')) {
                  showSnackBar(
                      'please provide a valid email address', context);
                  return;
                }
                if (!_emailController.text.contains('.com')) {
                  showSnackBar(
                      'please provide a valid email address', context);
                  return;
                }

                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: _emailController.text);
                showSnackBar("Reset email successfuly sent.", context);

                Navigator.pop(context);

              },
              child: Container(
                height: 50,
                child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void showSnackBar(title, context) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

