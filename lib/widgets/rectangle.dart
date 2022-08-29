import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:flutter/material.dart';

class MyRectangle extends StatelessWidget {
  const MyRectangle({Key? key, this.child, required this.text}) : super(key: key);

  final Widget? child;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: MyColors.gray6,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: child),
          ),
          const SizedBox(height: 10),
          Text(text, style: MyTextStyle.regular16.copyWith(color: MyColors.gray1))
        ],
      ),
    );
  }
}
