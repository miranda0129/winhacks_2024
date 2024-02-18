import 'package:flutter/material.dart';
import 'package:winhacks_2024/model/friend.dart';
import 'package:winhacks_2024/model/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckInWidget extends StatefulWidget {
  const CheckInWidget({super.key});

  @override
  State<CheckInWidget> createState() => _CheckInWidgetState();
}

class _CheckInWidgetState extends State<CheckInWidget> {
  List<Place> places = Place.getPlaces();
  List<Friend> friends = Friend.getFriends();
  List<int> checkIns = [1, 0, 0, 1];
  int currentCheckedLocation = -1;
  int currentSelectedLocation = -1;
  int prevLocation = -1;

  void checkIn() {
    setState(() {
      if (currentCheckedLocation != -1) {
        checkOut();
      } 
      currentCheckedLocation = currentSelectedLocation;
      getCheckInMessage();
    });
  }

  void checkOut() {
     setState(() {
      prevLocation = currentSelectedLocation;
      currentCheckedLocation = -1;
      currentSelectedLocation = -1;
      getCheckInMessage();
     });
  }

  String getCheckInMessage() {
    bool checkedIn = currentCheckedLocation >= 0 && currentCheckedLocation <= places.length;
    if (checkedIn) {
      String placeName = places[currentCheckedLocation].name;
      return 'You\'re checked in at: $placeName';
    } else {
      return "You are not checked in anywhere";
    }
  }

  String getCheckedInFriendsString() {
    if ((currentSelectedLocation >= 0) && (currentSelectedLocation < checkIns.length)) {
      final buffer = StringBuffer();

      if (currentCheckedLocation == currentSelectedLocation) {
        buffer.write("** you **\n");
      }

      for (Friend friend in friends) {
        if (friend.placeId == currentSelectedLocation) {
          buffer.write("${friend.name}\n");
        }
      }

      return buffer.toString();
    } else {
      return 'select location to view friends checked in there';
    }
    
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text(),
          content: Text(getCheckedInFriendsString()),
          actions: [
            TextButton(
              onPressed: () {
                // Close the alert dialog
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                getCheckInMessage(),
                style: const TextStyle(
                    fontSize: 18.0, // Adjust the font size
                    fontWeight: FontWeight.normal, // Make it bold
                    fontFamily: 'Roboto', // Use a specific font family if needed
                  ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Your Places',
                style: TextStyle(
                    fontSize: 24.0, // Adjust the font size
                    fontWeight: FontWeight.bold, // Make it bold
                    fontFamily: 'Roboto', // Use a specific font family if needed
                  ),),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: currentSelectedLocation == index ? Color.fromARGB(98, 101, 33, 117) : null,
                    title: Text(places[index].name),
                    subtitle: Text("Current friend Check-ins:  ${checkIns[index]}"),
                    onTap: () {
                      setState(() {
                        currentSelectedLocation = index;
                      });
                    },
                  );
                }
              ),
            ),
            TextButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              child: const Text("See who's checked-in"),
            )
          ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              if ( (currentCheckedLocation == currentSelectedLocation) && (currentSelectedLocation != -1) ) {
                checkOut();
              } else if (currentSelectedLocation >= 0 && currentSelectedLocation < checkIns.length) {
                checkIn();
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      //title: Text(),
                      content: const Text('Select a place to check-in'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Close the alert dialog
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
              );
              }
            },
            tooltip:  currentCheckedLocation == currentSelectedLocation ? 'Check out' : 'Check-In',
            child: currentCheckedLocation == currentSelectedLocation ? const Icon(Icons.exit_to_app) : const Icon(Icons.check),
          ),
    );
  }
}