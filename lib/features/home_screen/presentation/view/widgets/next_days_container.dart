import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_final_project/core/styles/styles.dart';

class NextDaysSizedBox extends StatelessWidget {
  const NextDaysSizedBox({super.key, required this.temp, required this.dayName, required this.image});
  final String temp;
  final String dayName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 80.h,
      width: 60.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dayName, style: TextStyles.font13WhiteSemiBold),
          Image.asset(image,
              fit: BoxFit.fill, width: 35.w, height: 30.h),
          Text(temp, style: TextStyles.font14WhiteBold),
        ],
      ),
    );
  }
}
