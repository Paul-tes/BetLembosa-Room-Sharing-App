import 'package:betlembosa/model/room.dart';
import 'package:flutter/material.dart';

class RoomTile extends StatelessWidget {
  Room room;
  RoomTile({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 25),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(room.imapgeUrl),
          ),

          // Infos of the room is goes here.
          
          // Descripton
          Text(
            room.description + room.location,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),

          // capacity
          Text(
            '👤' + room.capacity,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),

          // hosted by
          Text(
            'Hosted By  ' + room.hostBy,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),

          // price

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  // price
                   Text(
                    room.price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red[300],
                      fontSize: 30,
                    ),
                  ),
                ],
              ),

              // Add Button
              Container(
                padding: EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}