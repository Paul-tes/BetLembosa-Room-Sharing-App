// ignore_for_file: prefer_const_constructors

import 'package:betlembosa/components/bottom_nav_bar.dart';
import 'package:betlembosa/pages/about_page.dart';
import 'package:betlembosa/pages/reservation_page.dart';
import 'package:betlembosa/pages/rooms_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class  HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign out method
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

    // Navigate to the Home page
  void navigateToHome() {
    Navigator.of(context).pop(); // Close the drawer
    setState(() {
      _selectedPage = 0; // Set the selected page index to Home
    });
  }

  // Navigate to the About page
  void navigateToAbout() {
    Navigator.of(context).pop(); // Close the drawer
    // Navigate to the About page
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()));
  }


  // Integer value to controll selected pages that displays.
  int _selectedPage = 0;


  // the followig method will be update the selectedPage to switch over different pages
  void navigateBottomBar(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  // list of pages that are going to be displayed.
  final List<Widget> _pages = [
    // Home page [lists of all rooms]
    const RoomsPage(),

    // Reservation page [list of reserved rooms]
    const ReservationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
            DrawerHeader(
              child: Image.asset(
                'lib/images/logo.png',
                color: Colors.white,
              )
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onTap: navigateToHome,
              )
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onTap: navigateToAbout,
              )
            ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onTap: signOut,
              )
            ),
          ],
        ),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}