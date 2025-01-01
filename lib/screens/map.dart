// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:track_pro/models/location.dart';
// import 'dart:math';

// class MapScreen extends StatefulWidget {
//   const MapScreen(
//       {super.key,
//       this.location =
//           const PlaceLocation(long: 37.422, lat: -122.084, address: ''),
//       this.isSelecting = true});
//   final PlaceLocation location;
//   final bool isSelecting;

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//   Location _location = Location();
//   List<LatLng> _points = [];

//   @override
//   void initState() {
//     super.initState();
//     _startLocationTracking();
//   }

//   void _startLocationTracking() async {
//     var permissionStatus = await _location.requestPermission();
//     if (permissionStatus != PermissionStatus.granted) {
//       return;
//     }

//     _location.onLocationChanged.listen((LocationData currentLocation) {
//       _updateLocation(
//           LatLng(currentLocation.latitude!, currentLocation.longitude!));
//     });
//   }

//   void _updateLocation(LatLng newLocation) {
//     if (_points.isNotEmpty) {}

//     setState(() {
//       _points.add(newLocation);
//     });
//   }

//   String _determineActivity() {
//     if (_points.length < 2) return "Unknown";

//     double timeElapsed = 60.0;

//     return "Unknown";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//             Text(widget.isSelecting ? 'Pick your Location' : 'Your Location'),
//         actions: [
//           if (widget.isSelecting)
//             IconButton(onPressed: () {}, icon: Icon(Icons.save))
//         ],
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: LatLng(widget.location.lat, widget.location.long),
//           zoom: 16,
//         ),
//         markers: {
//           if (_points.isNotEmpty)
//             Marker(
//               markerId: MarkerId('current_location'),
//               position: _points.last,
//             ),
//         },
//         polylines: {
//           Polyline(
//             polylineId: PolylineId('route'),
//             points: _points,
//             color: Colors.blue,
//             width: 5,
//           ),
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:track_pro/models/location.dart';
import 'dart:math';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {super.key,
      this.location =
          const PlaceLocation(long: 37.422, lat: -122.084, address: ''),
      this.isSelecting = true});
  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Location _location = Location();
  List<LatLng> _points = [];

  bool _isTracking = false;

  @override
  void initState() {
    super.initState();
    _startLocationTracking();
  }

  void _startLocationTracking() async {
    // Request permissions
    var permissionStatus = await _location.requestPermission();
    if (permissionStatus != PermissionStatus.granted) {
      return;
    }

    // Start tracking location
    _location.onLocationChanged.listen((LocationData currentLocation) {
      _updateLocation(
          LatLng(currentLocation.latitude!, currentLocation.longitude!));
    });
  }

  void _updateLocation(LatLng newLocation) {
    if (_points.isNotEmpty) {
      double distance = _calculateDistance(
        _points.last.latitude,
        _points.last.longitude,
        newLocation.latitude,
        newLocation.longitude,
      );
    }

    setState(() {
      _points.add(newLocation);
    });

    // Update the map camera position to follow the new location
    mapController.animateCamera(
      CameraUpdate.newLatLng(newLocation),
    );
  }

  double _calculateDistance(lat1, lon1, lat2, lon2) {
    const R = 6371e3;
    double phi1 = lat1 * (pi / 180);
    double phi2 = lat2 * (pi / 180);
    double deltaPhi = (lat2 - lat1) * (pi / 180);
    double deltaLambda = (lon2 - lon1) * (pi / 180);

    double a = sin(deltaPhi / 2) * sin(deltaPhi / 2) +
        cos(phi1) * cos(phi2) * sin(deltaLambda / 2) * sin(deltaLambda / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  String _determineActivity() {
    if (_points.length < 2) return "Unknown";

    double distance = _calculateDistance(
      _points[_points.length - 2].latitude,
      _points[_points.length - 2].longitude,
      _points.last.latitude,
      _points.last.longitude,
    );

    double timeElapsed = 60.0;

    if (distance > 0) {
      double speed = distance / timeElapsed;
      if (speed < 4.5) {
        return "Not moving";
      } else {
        return "Running";
      }
    }

    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(onPressed: () {}, icon: Icon(Icons.save))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.location.lat, widget.location.long),
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers: {
          if (_points.isNotEmpty)
            Marker(
              markerId: MarkerId('current_location'),
              position: _points.last,
            ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isTracking = !_isTracking;
          });
        },
        child: Icon(_isTracking ? Icons.stop : Icons.play_arrow),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Total Distance:  m\nActivity: ${_determineActivity()}'),
        ),
      ),
    );
  }
}
