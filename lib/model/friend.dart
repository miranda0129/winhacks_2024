class Friend {
  String name;
  bool checkedIn;
  String place;
  String email;

  Friend({
    required this.name,
    required this.checkedIn,
    required this.place,
    required this.email,
  });

  String getLocationDisplay() {
    return checkedIn ? place : "Not checked in";
  }

  static List<Friend> getFriends() {
    return [
      Friend(name: "Dora", checkedIn: true, place: "Uni of Windsor", email: "dorastrelkova@gmail.com"), 
      Friend(name: "Marissa", checkedIn: true, place: "WRG", email: "krallMarissa@gmail.com"), 
      Friend(name: "Ryan", checkedIn: false, place:"", email: "ryanprarie@gmail.com")
    ];
  }

  void displayFriendRequest(String email) {

  }
}