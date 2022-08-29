import 'package:banking_app/widgets/rectangle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RectangleRow extends StatelessWidget {
  const RectangleRow({
    Key? key,
    required this.t1,
    required this.t2,
    required this.t3,
    required this.ch1,
    required this.ch2,
    required this.ch3,
  }) : super(key: key);

  final String t1, t2, t3;
  final String ch1, ch2, ch3;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          MyRectangle(text: t1, child: SvgPicture.asset(ch1)),
          const SizedBox(width: 11),
          MyRectangle(text: t2, child: SvgPicture.asset(ch2)),
          const SizedBox(width: 11),
          MyRectangle(text: t3, child: SvgPicture.asset(ch3)),
        ],
      ),
    );
  }
}
