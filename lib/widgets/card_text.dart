import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  const CardText({
    Key? key,
    required this.t1,
    required this.t2,
    this.fontSize,
  }) : super(key: key);

  final String t1;
  final String t2;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: t1,
        style: MyTextStyle.cardNumber.copyWith(color: MyColors.basicWhite, fontSize: fontSize),
        children: [
          TextSpan(
            text: t2,
            style: MyTextStyle.light32.copyWith(color: MyColors.basicWhite, fontSize: fontSize),
          )
        ],
      ),
    );
  }
}
