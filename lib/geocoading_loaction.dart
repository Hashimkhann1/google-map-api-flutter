import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps/address_notifer.dart';
import 'package:google_maps/counter.dart';

class GeoCoadingLocation extends StatefulWidget {
  GeoCoadingLocation({Key? key}) : super(key: key);

  @override
  State<GeoCoadingLocation> createState() => _GeoCoadingLocationState();
}

class _GeoCoadingLocationState extends State<GeoCoadingLocation> {
  // String? address = '';

  AddressConversion addressConversion = AddressConversion();

  @override
  Widget build(BuildContext context) {
    print('build Called');
    return Scaffold(
      appBar: AppBar(
        title: Text('GeoCoading'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder(valueListenable: addressConversion.setAddress, builder: (context, value, child) {
              return  Text('Address: ${value.toString()}',style: TextStyle(fontSize: 20),);
            }),
            Column(
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () async {
                      List<Placemark> placemarks =
                      await placemarkFromCoordinates(52.2165157, 6.9437819);
                      // address = placemarks.first.toString();
                      print('pressed');
                      addressConversion.setUpdatedAddress(placemarks.first.toString());
                    },
                    child: Text('Find Address',style: TextStyle(color: Colors.white,fontSize: 22),)),
                const SizedBox(height: 20,),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () async {
                      List<Location> locations =
                      await locationFromAddress("Gronausestraat 710, Enschede");
                      // address = locations.toString();
                      print('pressed');
                      addressConversion.setUpdatedAddress(locations.first.longitude.toString() + ' ' + locations.first.latitude.toString());
                    },
                    child: Text('Find Coordinates',style: TextStyle(color: Colors.white,fontSize: 22),)),
              ],
            ),
            TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Counter()));}, child: Text('Counter',style: TextStyle(fontSize: 24),))
          ],
        ),
      ),
    );
  }
}
