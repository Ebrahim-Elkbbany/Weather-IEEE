import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../features/home_screen/presentation/manager/get_weather_provider.dart';

Widget buildErrorWidget(String errorMessage, BuildContext context,GetWeatherProvider provider) {

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Oops! An error occurred:',
        style: TextStyle(color: Colors.red, fontSize: 16.sp),
      ),
      SizedBox(height: 20.h),
      Text(
        errorMessage,
        style: TextStyle(color: Colors.red, fontSize: 16.sp),
      ),
      SizedBox(height: 20.h),
      ElevatedButton(
        onPressed: () {
          provider.getWeather(context);
        },
        child: Text(
          'Retry',
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    ],
  );
}