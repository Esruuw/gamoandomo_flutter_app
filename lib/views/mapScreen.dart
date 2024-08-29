import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:flutter_geocoder/geocoder.dart';
import 'package:latlong2/latlong.dart';

class OsmMapPage extends StatefulWidget {
  @override
  _OsmMapPageState createState() => _OsmMapPageState();
}

class _OsmMapPageState extends State<OsmMapPage> {
  double long = 6.915952613713624;
  double lat = 36.87699971560823; 
  LatLng point = LatLng(6.915952613713624, 36.87699971560823);
  LatLng point2 = LatLng(6.284531064981042, 36.84169543246322);
  var location = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FlutterMap(
              // options: MapOptions(
              //   onTap: (tapPosition, p) async {
              //     var addresses = await Geocoder.local.findAddressesFromCoordinates(
              //         Coordinates(p.latitude, p.longitude));
              //
              //     setState(() {
              //       point = p;
              //       location = addresses;
              //       print(p);
              //     });
              //
              //     print("${location[0].countryName} - ${location[0].featureName}");
              //   },
              //   center: LatLng(6.915952613713624, 36.87699971560823),
              //   zoom: 10.0,
              // ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
    MarkerLayer(
  markers: [
    Marker(
      width: 100.0,
      height: 100.0,
      point: point,
      // Using the child parameter if your version requires it
      child: Icon(
        Icons.location_on,
        color: Colors.red,
      ),
    ),
    Marker(
      width: 80.0,
      height: 80.0,
      point: point2,
      child: Icon(
        Icons.location_on,
        color: Colors.red,
      ),
    ),
  ],
),

              ],
            ),
            Positioned(
              bottom: 10.0,
              child: Container(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Tourist application for GAMO and South OMO Zones"),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("OSM Tourist map for GAMO and South OMO Zones"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
