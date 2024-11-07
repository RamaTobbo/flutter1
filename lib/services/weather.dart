import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:track_pro/models/weather.dart';
import 'package:track_pro/provider/location.dart';

class WeatherService {
  static const String Base_Url =
      'https://api.openweathermap.org/data/2.5/weather';
  final String WeatherapiKey;

  WeatherService(this.WeatherapiKey);
  Future<Weather> getWeatherByCoordinates(
      double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$WeatherapiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    String? city = placemarks[0].locality;
    return city ?? "";
  }

  Future<Weather> getWeather(String location) async {
    final responseWeather = await http.get(
      Uri.parse('$Base_Url?q=$location&appid=$WeatherapiKey&units=metric'),
    );

    if (responseWeather.statusCode == 200) {
      return Weather.fromJson(jsonDecode(responseWeather.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
