import 'package:flutter/material.dart';
import 'package:winhacks_2024/model/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckInWidget extends StatefulWidget {
  const CheckInWidget({super.key});

  @override
  State<CheckInWidget> createState() => _CheckInWidgetState();
}

class _CheckInWidgetState extends State<CheckInWidget> {
  List<Place> places = Place.getPlaces();
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
      checkIns[currentCheckedLocation] = checkIns[currentCheckedLocation] + 1;
      getCheckInMessage();
    });
  }

  void checkOut() {
     setState(() {
      checkIns[currentCheckedLocation] = checkIns[currentCheckedLocation] - 1;
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
          ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              if ( (currentCheckedLocation == currentSelectedLocation) && (currentSelectedLocation != -1) ) {
                checkOut();
              } else {
                checkIn();
              }
            },
            tooltip:  currentCheckedLocation == currentSelectedLocation ? 'Check out' : 'Check-In',
            child: currentCheckedLocation == currentSelectedLocation ? const Icon(Icons.exit_to_app) : const Icon(Icons.check),
          ),
    );
  }
}