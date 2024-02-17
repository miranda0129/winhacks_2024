import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // for google maps

// instructions: https://codelabs.developers.google.com/codelabs/google-maps-in-flutter#3

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(42.304, -83.066);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Find your next Third Place'),
        elevation: 2,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("UoW"),
            position: LatLng(42.304, -83.066),
            infoWindow: InfoWindow(
              title: "Uni of Windsor",
              snippet: "hell",
            ),
          )
        } 
      ),
    ),
    );

    //return const Placeholder();
  }
}