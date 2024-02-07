import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_final_project/core/styles/app_theme.dart';
import 'package:weather_final_project/features/home_screen/presentation/manager/get_weather_provider.dart';
import 'package:weather_final_project/features/home_screen/presentation/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      minTextAdapt: true,
      child: ChangeNotifierProvider<GetWeatherProvider>(
        create: (context) => GetWeatherProvider()..getWeather(context),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: const HomeView(),
        ),
      ),
    );
  }
}
