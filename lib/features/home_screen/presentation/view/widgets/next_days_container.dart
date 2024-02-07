import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_final_project/core/styles/styles.dart';

class NextDaysSizedBox extends StatelessWidget {
  const NextDaysSizedBox({super.key, required this.temp, required this.dayName});
  final String temp;
  final String dayName;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 80.h,
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dayName, style: TextStyles.font13WhiteSemiBold),
          Image.asset('assets/images/rainy.png',
              fit: BoxFit.fill, width: 30.w, height: 30.h),
          Text(temp, style: TextStyles.font14WhiteBold),
        ],
      ),
    );
  }
}
