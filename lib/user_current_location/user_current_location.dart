import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class UserCurrentLocation extends StatefulWidget {
  const UserCurrentLocation({Key? key}) : super(key: key);

  @override
  State<UserCurrentLocation> createState() => _UserCurrentLocationState();
}

class _UserCurrentLocationState extends State<UserCurrentLocation> {

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(33.6844, 73.0479),
    zoom: 14
  );

  final List<Marker> _marker = <Marker>[
    Marker(
        markerId: MarkerId('1'),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(
        title: 'Title of the marker'
      )
    )
  ];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace){
      print('error in getting premmision');
    });

    return await Geolocator.getCurrentPosition();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_marker),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() + ' ' + value.longitude.toString());
            _marker.add(
              Marker(
                  markerId: MarkerId('2'),
                position: LatLng(value.latitude , value.longitude),
                infoWindow: InfoWindow(
                  title: 'My Current Location'
                )
              )
            );
            setState(() {

            });
            // print(_marker);
            CameraPosition cameraPosition = CameraPosition(
              target: LatLng(value.latitude , value.longitude),
              zoom: 14,
            );
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
          });
          setState(() {

          });
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}
