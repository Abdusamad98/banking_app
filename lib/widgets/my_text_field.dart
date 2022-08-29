import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: MyTextStyle.semiBold14.copyWith(color: MyColors.basicWhite),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: MyTextStyle.regular14.copyWith(color: MyColors.basicWhite),
        fillColor: const Color(0xFF262626),
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      cursorColor: Colors.white,
    );
  }
}
