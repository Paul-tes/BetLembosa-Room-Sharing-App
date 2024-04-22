import 'package:betlembosa/model/reservation.dart';
import 'package:betlembosa/model/room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationItem extends StatefulWidget {
  Room room;
  ReservationItem({
    super.key,
    required this.room,
  });

  @override
  State<ReservationItem> createState() => _ReservationItemState();
}

class _ReservationItemState extends State<ReservationItem> {

  // remove reservation method
  void removeReservation() {
    Provider.of<Reservation>(context, listen: false).removeReservation(widget.room);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 129, 188, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.room.imageUrl),
        title: Text(widget.room.location),
        subtitle: Text(
          widget.room.price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red[500],
            fontSize: 20,
          ),
        ),
        trailing: IconButton(
          onPressed: removeReservation, 
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}