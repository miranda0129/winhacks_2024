import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // for google maps
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:winhacks_2024/model/place.dart';
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

  List<Marker> getMarkers(List<Place> places) {
    List<Marker> markers = [];
    for (Place place in places) {
      markers.add(place.getMarker());
    }
    return markers;
  }

  // list of map markers on google map
  List<Marker> _marker = [];
  final List<Place> places = Place.getPlaces();
  late final List<Marker> _list = getMarkers(places);

    //BitmapDescriptor markerIcon1 = BitmapDescriptor.defaultMarker;
    //BitmapDescriptor markerIcon2 = BitmapDescriptor.defaultMarker;
    //BitmapDescriptor markerIcon3 = BitmapDescriptor.defaultMarker;
    //BitmapDescriptor markerIcon4 = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    // implement initState
     //addCustomIcon();
     setState(() {
      _marker = _list;
    });
  }

/*
void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/Location_marker.png")
        .then(
      (icon) {
        setState(() {
          markerIcon1 = icon;
        });
      },
    );
}
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
    ),
    home: Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 12.0,
        ),
        //markers: {
          //const Marker(
           // markerId: MarkerId("UoW"),
           //position: LatLng(42.304, -83.066),
            //infoWindow: InfoWindow(
              //title: "Uni of Windsor",
              //snippet: "hell",
            //),
          //)
        //} 
        markers: Set.from(_marker),
      ),
    ),
    );

    //return const Placeholder();
  }
}

