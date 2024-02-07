import 'package:intl/intl.dart';

class FiveDayData {
  final String? dateTime;
  final String? image;
  final int? temp;


  FiveDayData({this.dateTime, this.temp,this.image});

  factory FiveDayData.fromJson(dynamic json) {
    return FiveDayData(
      dateTime: json['dt_txt'],
      image: json['weather'][0]['icon'],
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
}
