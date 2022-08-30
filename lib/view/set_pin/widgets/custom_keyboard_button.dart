import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomKeyboardItem extends StatelessWidget {
  const CustomKeyboardItem({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: MyTextStyle.light32
            .copyWith(color: Theme.of(context).textTheme.headline1?.color),
      ),
      style: TextButton.styleFrom(
          backgroundColor: MyColors.gray6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
    );
  }
}
