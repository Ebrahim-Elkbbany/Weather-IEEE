
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final IconData? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Function()? suffixIconTap;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.suffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        controller: controller,
        cursorColor:  const Color(0xff447FC5),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black54,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.3,
                  color: Colors.black54
                ),
                borderRadius: BorderRadius.circular(32),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          hintStyle: hintStyle ?? TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
          ) ,
          hintText: hintText,
          suffixIcon: GestureDetector(
            onTap: suffixIconTap,
            child: Container(
              width: 85.w,
               decoration: const BoxDecoration(
                 color:  Color(0xffE96E50),
                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(32),topRight: Radius.circular(32)),
               ),
              child: Center(
                child: Text(
                  'search',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ),
          fillColor: backgroundColor ?? Colors.white,
          filled: true,
        ),
        obscureText: isObscureText ?? false,
        validator: (value) {
          return validator(value);
        },
      ),
    );
  }
}
