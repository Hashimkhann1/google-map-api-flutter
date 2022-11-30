import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          markers: Set.of(listOfMarker),
          // mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
            target: LatLng(34.1612, 71.8453),
            zoom: 14.0
        ),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:LatLng(20.5937, 78.9629) )));

          setState(() {
            print('>>>>>>>>> google map moveing animation');
          });
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}
