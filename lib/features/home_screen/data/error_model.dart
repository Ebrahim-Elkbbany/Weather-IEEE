

class GetWeatherError {
  String cod;
  String message;

  GetWeatherError({
    required this.cod,
    required this.message,
  });

  factory GetWeatherError.fromJson(Map<String, dynamic> json) => GetWeatherError(
    cod: json["cod"],
    message: json["message"],
  );


}
