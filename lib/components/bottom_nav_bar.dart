import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Rooms",
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
    
          GButton(
            icon: Icons.checklist_outlined,
            text: "Reservations",
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
    
          GButton(
            icon: Icons.calendar_month,
            text: "Booking",
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
    
          GButton(
            icon: Icons.add_business,
            text: "My Rooms",
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          )
        ]
      ),
    );
  }
}