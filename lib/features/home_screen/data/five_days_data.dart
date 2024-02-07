import 'package:intl/intl.dart';

class FiveDayData {
  final String? dateTime;
  final int? temp;
  List<FiveDayData> dataList = [];

  FiveDayData({this.dateTime, this.temp});

  factory FiveDayData.fromJson(dynamic json) {
    return FiveDayData(
      dateTime: DateFormat('EEEE').format(DateTime.parse(json['dt_txt'])),
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }

  static List<FiveDayData> fromJsonList(List<dynamic> jsonList) {
    List<FiveDayData> dataList = [];
    List<String> processedDays = [];

    for (dynamic json in jsonList) {
      if (json == null) {
        continue;
      }

      String day = DateFormat('EEEE').format(DateTime.parse(json['dt_txt']));


      if (!processedDays.contains(day)) {
        dataList.add(
          FiveDayData(
            dateTime: day,
            temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
          ),
        );

        processedDays.add(day);
      }
    }

    return dataList;
  }
}
