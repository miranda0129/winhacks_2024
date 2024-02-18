
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:winhacks_2024/model/friend.dart';

class Place {
  int id;
  String name;
  LatLng location;
  String comment;

  Place({
    required this.id,
    required this.name,
    required this.location,
    required this.comment,
  });

  static List<Place> getPlaces() {
      return [
        Place(id: 1, name: "Windsor Rock Gym", location: const LatLng(42.31542205810547,-83.00333404541016), comment: "Bouldering hangout spot, busiest on Wed & Fri."),
        Place(id: 2, name: "Willistead Park", location: const LatLng(42.31794738769531,-83.00985717773438), comment: "Pretty paths for mental health walks."),
        Place(id: 3, name: "Leddy Library", location: const LatLng(42.30780029296875,-83.06781768798828), comment: "Nice atmosphere for getting work done!"),
        Place(id: 4, name: "Green Bean", location: const LatLng(42.305442810058594,-83.06262969970703), comment: "Great coffee and music, very cozy."),
      ];
  }

  Marker getMarker() {
    return //[
    Marker(
        markerId: MarkerId('$id'),
      position: location,
      infoWindow: InfoWindow(
        title: name,
        snippet: comment,
      )
    );
  }

  // List<Friend> getCheckedInFriends() {
  //   List<Friend> friends = Friend.getFriends();
  //   List<Friend> filteredList = friends.where((friend) => friend.place.)

  // }
}