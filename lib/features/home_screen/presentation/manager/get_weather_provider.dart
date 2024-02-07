import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:weather_final_project/core/location/location_service.dart';
import 'package:weather_final_project/features/home_screen/data/current_weather_data.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_final_project/features/home_screen/data/error_model.dart';
import 'package:weather_final_project/features/home_screen/data/five_days_data.dart';

class GetWeatherProvider extends ChangeNotifier {
  String apiKey = '890983319c7103c48976f238882d6915';
  String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  TextEditingController cityController = TextEditingController();
  CurrentWeatherData? weatherContent;
  List<FiveDayData>? nextDaysWeatherContent;
  bool isLoading = false;
  String errorMessage = '';
  List<String> processedDays = [];

  Future<void> getWeather(BuildContext context) async {
    _setLoading(true);

    try {
      final location = await _getLocation();
      final placeMarks = await _getPlaceMarks(location!);
      final currentWeatherUrl = _buildCurrentWeatherUrl(placeMarks);
      final nextDaysUrl = _buildNextDaysUrl(placeMarks);

      await _fetchCurrentWeather(currentWeatherUrl);
      await _fetchNextDays(nextDaysUrl);
    } catch (e) {
      _setError(e.toString());
    }

    _setLoading(false);
  }

  Future<LocationData?> _getLocation() async {
    return await LocationService().getLocation() ;
  }

  Future<List<Placemark>> _getPlaceMarks(LocationData location) async {
    return await placemarkFromCoordinates(
      location.latitude!,
      location.longitude!,
      localeIdentifier: 'en',
    );
  }

  String _buildCurrentWeatherUrl(List<Placemark> placeMarks) {
    return '${baseUrl}weather?q=${cityController.text.isEmpty ? placeMarks[0].country : cityController.text}&appid=$apiKey';
  }

  String _buildNextDaysUrl(List<Placemark> placeMarks) {
    return '${baseUrl}forecast?q=${cityController.text.isEmpty ? placeMarks[0].country : cityController.text}&appid=$apiKey';
  }

  Future<void> _fetchCurrentWeather(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      final data = jsonDecode(response.body);
      final error = GetWeatherError.fromJson(data);
      _setError(error.message);
    } else {
      final data = jsonDecode(response.body);
      weatherContent = CurrentWeatherData.fromJson(data);
      if (kDebugMode) {
        print(weatherContent?.name ?? 'not name');
      }
    }
  }

  Future<void> _fetchNextDays(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      final data = jsonDecode(response.body);
      final error = GetWeatherError.fromJson(data);
      _setError(error.message);
    } else {
      final data = jsonDecode(response.body);
      nextDaysWeatherContent = (data['list'] as List).map((t) => FiveDayData.fromJson(t)).toList();
      for(var i in nextDaysWeatherContent! ){
        String day = DateFormat('EEEE').format(DateTime.parse(i.dateTime!)).substring(0,3);
        if (!processedDays.contains(day)) {
          processedDays.add(day);
        }
      }
    }
  }

  void _setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  void _setError(String message) {
    errorMessage = message;
    notifyListeners();
  }
}
