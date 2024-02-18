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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    //isThreeLine: true,
                    title: Text(places[index].name),
                    //subtitle: Text(places[index].getLocationDisplay()),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('pressed');
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
    );;
  }
}