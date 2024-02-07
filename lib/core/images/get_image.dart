String getWeatherIconImage(String  iconCode) {
  switch (iconCode) {
    case '01d':
      return 'assets/images/clear.png';
    case '02d':
      return 'assets/images/cloudy.png';
    case '03d':
      return 'assets/images/cloudy.png';
    case '04d':
      return 'assets/icons/cloudy.png';
    case '09d':
      return 'assets/images/rainy.png';
    case '10d':
      return 'assets/images/rainy.png';
    case '11d':
      return 'assets/images/thunderstorm.png';
    case '13d':
      return 'assets/images/snow.png';
    case '50d':
      return 'assets/icons/snow.png';
    default:
      return 'assets/images/clear.png';
  }
}