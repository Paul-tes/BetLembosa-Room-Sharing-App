// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:betlembosa/components/my_button.dart';
import 'package:betlembosa/components/my_text_filed.dart';
import 'package:betlembosa/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      );

      // pop up the circular progress after login
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {

      // pop up the circular progress to show the error message.
      Navigator.pop(context);

      /* we can customize the following error  as follows.

      // login attempt errors
      if(e.code == "network-request-failed") {
        // netwo connection problems
        errorLog("Connection Problem. Please check your internet connection.");
      } else if(e.code == 'invalid-email') {
        // Invalid email address use
        errorLog('Please Provide valid email address');
      } else if(e.code == "invalid-credential") {
        // Incorrect email or password
        errorLog('Envalid email and password');
      }

      */
      errorLog(e.code);
    }
  }

  void errorLog(String message) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Error",
            style: TextStyle(color: Colors.white),
            ),
            content: Text(message, style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.red[400],
        );
      },
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                // logo
                Icon(
                    Icons.home_rounded,
                    size: 70,
                    color: Colors.black,
                  ),
        
                SizedBox(height: 25),
                // welcome back, you've been missed
                Text(
                  "Welocme to BetLembosa",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
        
                SizedBox(height: 25),
        
                // email text field
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false
                ),
        
                SizedBox(height: 10),
                // password text field
                MyTextField(
                  controller: passwordController,
                  hintText: "password",
                  obscureText: true,
                ),
        
                SizedBox(height: 10),
                // forgoten password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
        
                SizedBox(height: 25.0),
                // sign in butoon
                MyButton(
                  onTap: signUserIn,
                  title: 'Sign In',
                ),
                SizedBox(height: 50.0),
                // or continue with
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                    ]
                  ),
                ),
                
                SizedBox(height: 30.0),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google + apple sign in buton
                    SquareTile(imagePath: 'lib/images/google.png'),
        
                    SizedBox(width: 10),
        
                    SquareTile(imagePath: 'lib/images/apple.png'),
                  ],
                ),
        
                SizedBox(height: 20.0),
                // not a menber reqister now!
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a menber?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      // register now on tap to change the page.
                      onTap: widget.onTap,
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                  ]
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}