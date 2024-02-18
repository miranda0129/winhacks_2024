import 'package:winhacks_2024/model/place.dart';

class Friend {
  String name;
  bool checkedIn;
  String place;
  int placeId;
  String email;
  bool accepted;

  Friend({
    required this.name,
    required this.checkedIn,
    required this.place,
    required this.placeId,
    required this.email,
    required this.accepted,
  });

  String getLocationDisplay() {
    if (accepted) {
      return checkedIn ? place : "Not checked in";
    } else {
      return "Check-in info not available";
    }
  }

  static List<Friend> getFriends() {
    return [
      Friend(name: "Dora", checkedIn: true, place: "Green Bean", placeId: 3, email: "dorastrelkova@gmail.com", accepted: true), 
      Friend(name: "Marissa", checkedIn: true, place: "Windsor Rock Gym", placeId: 0, email: "krallMarissa@gmail.com", accepted: true), 
      Friend(name: "Ryan", checkedIn: false, place:"", placeId: -1, email: "ryanprarie@gmail.com", accepted: true)
    ];
  }

  String getFriendInfo() {
    if (accepted) {
      return "$name, $email";
    } else {
      return "$email, friend request pending";
    }
    
  }
}