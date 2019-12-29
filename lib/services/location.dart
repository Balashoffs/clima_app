import 'dart:math';

import 'package:geolocator/geolocator.dart';

class Location{
  double _latitude = 0;
  double _longitude = 0;

  double get latitude => _latitude;
  double get longitude => _longitude;

  Random rnd = Random();

  static bool isFirst = true;
  Future<void> getCurrentLocation() async {
    try {
      if(isFirst){
        Position position = await Geolocator().getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        _latitude = position.latitude;
        _longitude = position.longitude;
        isFirst = false;
      }else{
        int la = rnd.nextInt(45)-45;
        int lo = rnd.nextInt(90)-90;
        _latitude = la.toDouble();
        _longitude =lo.toDouble();
      }

    } catch (e) {
      print(e);
    }
  }

  @override
  String toString() {
    return ("latitude: {$_latitude}, longitude: {$_longitude}");
  }
}