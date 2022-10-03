import 'package:co_ordinator/LoginPage/ResetPassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../HomePage/homePage.dart';

class LoginPage extends StatelessWidget {

  final auth=FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isTrue=true;

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Hello Co-ordinator!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Welcome back :)'),
              SizedBox(
                height: 40,
              ),
              Image(
                width: 300,
                height: 200,
                image: AssetImage(
                  'assets/images/logo4.png',
                ),
              ),
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
              SizedBox(
                height: 20,
              ),
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
                      controller: _passwordController,
                      obscureText: isTrue,
                      decoration: InputDecoration(
                          hintText: 'Password', border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPass(),
                          ),
                        );

                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    if (_emailController.text == null) {
                      showSnackBar('Please proviide a valid email', context, Colors.red);
                      return;
                    }
                    if (!_emailController.text.contains('@')) {
                      showSnackBar(
                          'please provide a valid email address', context, Colors.red);
                      return;
                    }
                    if (!_emailController.text.contains('.com')) {
                      showSnackBar(
                          'please provide a valid email address', context, Colors.red);
                      return;
                    }
                    if (_passwordController.text.isEmpty) {
                      showSnackBar('The password is incorrect', context, Colors.red);
                      return;
                    }
                    try {
                      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text
                      );
                      showSnackBar('Successful Login', context, Colors.green);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                       setPersistence();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar('No user found for that email.', context, Colors.red);

                      } else if (e.code == 'wrong-password') {
                        showSnackBar('Wrong password provided for that user.', context, Colors.red);

                      }
                    }
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
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> setPersistence() async {
      await FirebaseAuth.instance.setPersistence(Persistence.SESSION);
  }
}



void showSnackBar(title, context, color) {
  final SnackBar snackBar = SnackBar(
    backgroundColor: color,
    content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
