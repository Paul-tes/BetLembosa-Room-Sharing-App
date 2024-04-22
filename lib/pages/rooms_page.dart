import 'package:betlembosa/components/room_tile.dart';
import 'package:betlembosa/model/reservation.dart';
import 'package:betlembosa/model/room.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  // reservation method
  void reserveRoom(Room room) {
    Provider.of<Reservation>(context, listen: false).reserve(room);

    // after reservation let's show a dialog message
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Reservation Complate"),
        content: Text("Check your reservation list now"),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Reservation>(builder: (context, value, child) => Column(
      children: [
        // search Bar
        Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8)
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),

        // Cool Message about betlembosa
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'BetLembosa Your Home',
            style: TextStyle(color: Colors.grey[600]),
          )
        ),


        // New Posts
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Amazing Rooms 🛏️ ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),

        const SizedBox(height: 15),

        // Lists of Rooms
        Expanded
        (child: ListView.builder(
          itemCount: value.getRoomList().length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // return room lists form reservation using a provider state management class.
            Room room = value.getRoomList()[index];
            return RoomTile(
              room: room,
              addOnTap: () => reserveRoom(room),
            );
          }
          ) 
        ),

        const Padding(
          padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
          child: Divider(
          color: Colors.white
          )
        ),

      ],
    ),);
  }
}