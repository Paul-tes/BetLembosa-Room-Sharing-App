import 'package:betlembosa/components/reservation_item.dart';
import 'package:betlembosa/model/room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            // heading ro reservation list pages,
            const Text(
              'My Reservations',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 10),

            // Lists of reservation cards.
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  // get all reserved rooms
                  Room room = value.getReservations()[index];

                  // return the reservation card for each room.
                  return ReservationItem();
                }
              )
            )
          ],
        )
      ),
    );
  }
}