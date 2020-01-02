import 'dart:math';

import 'package:geolocator/geolocator.dart';

class Location{
  double _latitude = 0;
  double _longitude = 0;

  double get latitude => _latitude;
  double get longitude => _longitude;

  Future<void> getCurrentLocation() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position){
        _latitude = position.latitude;
        _longitude = position.longitude;
    }).catchError((e){
      print(e);
    });
  }

  @override
  String toString() {
    return ("latitude: {$_latitude}, longitude: {$_longitude}");
  }
}