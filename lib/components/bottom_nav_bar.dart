import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const GNav(
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Rooms",
          ),

          GButton(
            icon: Icons.checklist_outlined,
            text: "Reservations",
          ),

          GButton(
            icon: Icons.calendar_month,
            text: "Booking",
          ),

          GButton(
            icon: Icons.add_business,
            text: "My Rooms",
          )
        ]
      ),
    );
  }
}