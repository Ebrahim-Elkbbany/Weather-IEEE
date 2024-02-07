import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_final_project/core/images/get_image.dart';
import 'package:weather_final_project/core/styles/styles.dart';
import 'package:weather_final_project/core/widgets/custom_text_form_field.dart';
import 'package:weather_final_project/core/widgets/error_widget.dart';
import 'package:weather_final_project/features/home_screen/presentation/manager/get_weather_provider.dart';
import 'package:weather_final_project/features/home_screen/presentation/view/widgets/next_days_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.w),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff447FC5),
                  Color(0xff3F6CB7),
                  Color(0xff3953A3),
                ],
              ),
            ),
            child: Consumer<GetWeatherProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    AppTextFormField(
                      suffixIconTap: () {
                        provider.getWeather(context);
                        provider.errorMessage='';
                      },
                      controller: provider.cityController,
                      hintText: 'Enter Location',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter location';
                        }
                      },
                    ),
                    SizedBox(height: 70.h),
                    if (provider.isLoading)
                      const CircularProgressIndicator(color: Colors.white)
                    else if (provider.errorMessage.isNotEmpty)
                      buildErrorWidget(provider.errorMessage, context,provider)
                      else
                        Column(
                          children: [
                            Text(
                              provider.weatherContent!.name!.toUpperCase(),
                              style: TextStyles.font24WhiteSemiBold,
                            ),
                            SizedBox(height: 25.h),
                            Image.asset(
                              getWeatherIconImage(provider.weatherContent!.weather![0].icon!),
                              fit: BoxFit.fill,
                              width: 60.w,
                              height: 55.h,
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              '${(provider.weatherContent!.main!.temp! - 273.15).round().toString()}\u2103',
                              style: TextStyles.font24WhiteBold,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${(provider.weatherContent!.main!.tempMax! - 273.15).round().toString()}\u2103',
                                  style: TextStyles.font13WhiteRegular,
                                ),
                                SizedBox(width: 7.w),
                                Text(
                                  '${(provider.weatherContent!.main!.tempMin! - 273.15).round().toString()}\u2103',
                                  style: TextStyles.font13WhiteRegular,
                                ),
                              ],
                            ),
                            SizedBox(height: 70.h),
                            SizedBox(
                              height: 80.h,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return  NextDaysSizedBox(temp: '${(provider.nextDaysWeatherContent?[index].temp ?? 273.15- 273.15).round().toString()}\u2103' ?? "0", dayName: provider.nextDaysWeatherContent?[index].dateTime ??'',);
                                },
                                itemCount: 5,
                              ),
                            ),
                          ],
                        ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }}

