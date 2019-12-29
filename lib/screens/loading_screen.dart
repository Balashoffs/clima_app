
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherModel weatherModel = WeatherModel();

  void getLocation()async{
    var weatherData = await weatherModel.getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData: weatherData);
    }));
}

  @override
  Future<void> initState(){
    super.initState();
    getLocation();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )
      ),
    );
  }
}
