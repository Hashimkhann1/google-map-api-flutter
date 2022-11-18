import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> listOfMarker = [
    Marker(
        markerId: MarkerId('1'),
      position: LatLng(34.1612, 71.8453),
      infoWindow: InfoWindow(
        title: 'Sardhari',
        onTap: () {}
      )
    ),
    Marker(
        markerId: MarkerId('2'),
      position: LatLng(34.171975, 71.873495),
      infoWindow: InfoWindow(
        title: 'Home',
      )
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          markers: Set.of(listOfMarker),
          // mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
            target: LatLng(34.1612, 71.8453),
            zoom: 14.0
        ))
      ),
    );
  }
}
