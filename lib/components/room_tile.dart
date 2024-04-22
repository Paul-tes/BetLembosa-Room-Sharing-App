import 'package:betlembosa/model/room.dart';
import 'package:flutter/material.dart';

class RoomTile extends StatelessWidget {
  void Function()? addOnTap;
  Room room;
  RoomTile({
    super.key,
    required this.room,
    required this.addOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 5),
      width: 230,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(room.imageUrl),
          ),

          // Infos of the room is goes here.
          
          // Descripton
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              room.description + room.location,
              style: TextStyle(
                color: Colors.grey[600],
              ),
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

          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                GestureDetector(
                  onTap: addOnTap,
                  child: Container(
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
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}