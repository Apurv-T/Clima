import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'dart:convert';
import 'location_screen.dart';

const String key = 'bdd7e29326e0bfe9724dd2cc0f775fe6';
double lat = 0.0;
double lon = 0.0;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    location locate = new location();
    await locate.getCurrentLocation();
    lat = locate.getLongitude();
    lon = locate.getLatitude();
    NetworkHelper networkHelper = new NetworkHelper(
        'api.openweathermap.org/data/2.5/weather?lat={$lat}&lon={$lon}&appid={$key}');
    var weatherData = await networkHelper.getData();

//    double temp = jsonDecode(weatherData.body)['main']['temp'];
//    String city = jsonDecode(weatherData.body)['name'];
//    int condition = jsonDecode(weatherData.body)['weather'][0]['id'];
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
