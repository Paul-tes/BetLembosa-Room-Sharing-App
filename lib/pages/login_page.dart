// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:betlembosa/components/my_button.dart';
import 'package:betlembosa/components/my_text_filed.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              // logo
              Icon(
                  Icons.lock,
                  size: 100,
                ),

              SizedBox(height: 50),
              // welcome back, you've been missed
              Text(
                "Welocme to BetLembosa",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 25),

              // user name text field
              MyTextField(
                controller: userNameController,
                hintText: "User Name",
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
              
              // google + apple sign in buton
              
              // not a menber reqister now!
            ]
          ),
        ),
      )
    );
  }
}