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
}