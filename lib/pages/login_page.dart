// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:betlembosa/components/my_button.dart';
import 'package:betlembosa/components/my_text_filed.dart';
import 'package:betlembosa/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

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
    } on FirebaseAuthException catch (e) {
      // if there is no network
      if (e.code == 'network-request-failed') {
        ErrorMessage("User not found");
      }
      // wrong email and password is entered
      else if (e.code == 'invalid-credential') {
        ErrorMessage('Envalid User name and Password');
      }
    }


    Navigator.pop(context);

  }

  void ErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message)
        );
      }
    );
  }

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
                    color: Colors.brown,
                  ),
        
                SizedBox(height: 35),
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
                
                SizedBox(height: 50.0),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google + apple sign in buton
                    SquareTile(imagePath: 'lib/images/google.png'),
        
                    SizedBox(width: 10),
        
                    SquareTile(imagePath: 'lib/images/apple.png'),
                  ],
                ),
        
                SizedBox(height: 40.0),
                // not a menber reqister now!
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a menber?'),
                    const SizedBox(width: 4),
                    Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      )
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