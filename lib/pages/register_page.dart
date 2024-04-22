// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:betlembosa/components/my_button.dart';
import 'package:betlembosa/components/my_text_filed.dart';
import 'package:betlembosa/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  // text controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confiurmPasswordController = TextEditingController();

  // sign up user
  void signUserUp() async {

    // shoe circular progressing dialog.
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    // try to create user
    try {
      // check if the password and conifurmation password are the same.
      if (passwordController.text == confiurmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        Navigator.pop(context);
        errorLog("The password does not match");
      } 

    } on FirebaseAuthException catch (e) {

      // pop up the circular progress to show the error message.
      Navigator.pop(context);

      /* error code message can be customize as follows.
      // login attempt errors
      if(e.code == "network-request-failed") {
        // netwo connection problems
        print(e.code);
        errorLog(e.code);
      } else if(e.code == 'invalid-email') {
        // Invalid email address use
        print(e.code);
        errorLog(e.code);
      } else if(e.code == "invalid-credential") {
        // Incorrect email or password
        print(e.code);
        errorLog(e.code);
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
                SizedBox(
                  child: Image.asset(
                    'lib/images/logo.png',
                  ),
                  height: 100,
                ),
                // welcome back, you've been missed
                Text(
                  "Create a BetLembosa account",
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
                  hintText: "Password",
                  obscureText: true,
                ),
        
                SizedBox(height: 10),
                // confirmation password
                MyTextField(
                  controller: confiurmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),               

                SizedBox(height: 25.0),
                // sign in butoon
                MyButton(
                  onTap: signUserUp,
                  title: 'Sign Up',
                ),
                SizedBox(height: 30.0),
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
                
                SizedBox(height: 25.0),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google + apple sign in buton
                    SquareTile(imagePath: 'lib/images/google.png'),
        
                    SizedBox(width: 10),
        
                    SquareTile(imagePath: 'lib/images/apple.png'),
                  ],
                ),
        
                SizedBox(height: 30.0),
                // not a menber reqister now!
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an Account?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      // register now on tap to change the page.
                      onTap: widget.onTap,
                      child: Text(
                        'Login Now',
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