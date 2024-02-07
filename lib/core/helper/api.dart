import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  String url = 'https://api.openweathermap.org/data/2.5/';
  Future<dynamic> get({
    required String endPoint,
    String? token,
  }) async {
    http.Response response = await http.get(Uri.parse('$url$endPoint'));
    return jsonDecode(response.body);
  }
}
