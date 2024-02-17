class Friend {
  String name;
  bool checkedIn;
  String place;

  Friend({
    required this.name,
    required this.checkedIn,
    required this.place,
  });

  String getLocationDisplay() {
    return checkedIn ? place : "Not checked in";
  }
}