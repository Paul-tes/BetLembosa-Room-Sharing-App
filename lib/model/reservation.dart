import 'package:betlembosa/model/room.dart';
import 'package:flutter/material.dart';

class Reservation extends ChangeNotifier {
  // list of rooms

  List<Room> rooms = [
    Room(
      hostBy: "John Doe",
      price: "100",
      capacity: "2",
      location: "123 Main Street, City, Country",
      description: "Cozy room with a beautiful view",
      imageUrl: 'lib/images/Rooms/room1.jpeg'
    ),
    Room(
      hostBy: "Alice Smith",
      price: "120",
      capacity: "3",
      location: "456 Elm Street, Town, Country",
      description: "Spacious room with modern amenities",
      imageUrl: 'lib/images/Rooms/room2.jpeg',
    ),
    Room(
      hostBy: "Michael Johnson",
      price: "90",
      capacity: "1",
      location: "789 Oak Avenue, Village, Country",
      description: "Quaint room in a peaceful neighborhood",
      imageUrl: 'lib/images/Rooms/room3.jpeg',
    ),
    Room(
      hostBy: "David Wilson",
      price: "80",
      capacity: "1",
      location: "202 Cedar Lane, Suburb, Country",
      description: "Simple yet comfortable room",
      imageUrl: 'lib/images/Rooms/room5.jpeg',
    ),
    Room(
      hostBy: "Sarah Taylor",
      price: "110",
      capacity: "2",
      location: "303 Maple Drive, Beachside, Country",
      description: "Beachfront room with stunning ocean views",
      imageUrl: 'lib/images/Rooms/room6.jpeg',
    ),
    Room(
      hostBy: "Daniel Martinez",
      price: "130",
      capacity: "3",
      location: "404 Birch Boulevard, Riverside, Country",
      description: "Riverside retreat perfect for families",
      imageUrl: 'lib/images/Rooms/room7.jpeg',
    ),
    Room(
      hostBy: "Olivia Garcia",
      price: "95",
      capacity: "1",
      location: "505 Walnut Lane, Lakeside, Country",
      description: "Tranquil room overlooking a serene lake",
      imageUrl: 'lib/images/Rooms/room8.jpeg',
    ),
    Room(
      hostBy: "William Rodriguez",
      price: "140",
      capacity: "2",
      location: "606 Chestnut Street, Mountainside, Country",
      description: "Mountain hideaway with hiking trails nearby",
      imageUrl: 'lib/images/Rooms/room9.jpeg',
    ),
    Room(
      hostBy: "Sophia Hernandez",
      price: "85",
      capacity: "1",
      location: "707 Spruce Avenue, Countryside, Country",
      description: "Cozy cottage room in the countryside",
      imageUrl: 'lib/images/Rooms/room10.jpeg',
    ),
    Room(
      hostBy: "James Lopez",
      price: "125",
      capacity: "2",
      location: "808 Pine Lane, Hillside, Country",
      description: "Hillside room with panoramic views",
      imageUrl: 'lib/images/Rooms/room11.jpeg',
    ),
    Room(
      hostBy: "Charlotte Martinez",
      price: "100",
      capacity: "2",
      location: "909 Elm Street, Downtown, Country",
      description: "Charming room in the heart of the city",
      imageUrl: 'lib/images/Rooms/room12.jpeg',
    ),
    Room(
      hostBy: "Liam Smith",
      price: "75",
      capacity: "1",
      location: "1010 Oak Road, Seaside, Country",
      description: "Seaside room with access to the beach",
      imageUrl: 'lib/images/Rooms/room13.jpeg',
    ),
    Room(
      hostBy: "Amelia Johnson",
      price: "135",
      capacity: "3",
      location: "1111 Birch Lane, Countryside, Country",
      description: "Country farmhouse room with rustic charm",
      imageUrl: 'lib/images/Rooms/room14.jpeg',
    ),
    Room(
      hostBy: "Noah Wilson",
      price: "90",
      capacity: "1",
      location: "1212 Maple Avenue, Forest, Country",
      description: "Forest retreat perfect for nature lovers",
      imageUrl: 'lib/images/Rooms/room15.jpeg',
    ),
  ];

  // list of rooms in user reservation
  // booking date attachement will done here later
  List<Room> reservations = [];
  // get lists of rooms for reservation

  // get Rooms
  List<Room> getRoomList() {
    return rooms;
  }
  

  // get all reservation
  List<Room> getReservations() {
    return reservations;
  }

  // add room to reservation
  void reserve(Room room) {
    reservations.add(room);
    notifyListeners();
  }


  // remove the room form reservation
  void removeReservation(Room room) {
    reservations.remove(room);
    notifyListeners();
  }
}