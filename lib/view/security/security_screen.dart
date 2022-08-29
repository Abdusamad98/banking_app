import 'package:banking_app/data/local_data/storage.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/icons.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:banking_app/view_model/security_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Text("Security screen",
                  style: MyTextStyle.semiBold20
                      .copyWith(color: MyColors.basicWhite)),
              const SizedBox(height: 70),
              Text("Enter your passcode",
                  style: MyTextStyle.regular16
                      .copyWith(color: MyColors.basicWhite)),
              const SizedBox(height: 35),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      context
                          .watch<SecurityViewModel>()
                          .greenDotsNumber,
                          (index) =>
                      const CircleAvatar(
                          radius: 6, backgroundColor: MyColors.green),
                    ),
                    ...List.generate(
                      4 - context
                          .watch<SecurityViewModel>()
                          .greenDotsNumber,
                          (index) =>
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: MyColors.basicWhite.withOpacity(
                                0.2),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 65),
              Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 35,
                  crossAxisSpacing: 35,
                  crossAxisCount: 3,
                  children: List.generate(
                    12,
                        (index) =>
                        GestureDetector(
                          onTap: () {
                            context.read<SecurityViewModel>().onGestureTap(listLength: 4, index: index, context: context);
                          },
                          child: getMyWidget(index: index, context: context),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getMyWidget({required int index, required BuildContext context}) {
    if (index == 9) {
      return CircleAvatar(
        backgroundColor: MyColors.basicBlack,
        child: Center(
            child: !(context.watch<SecurityViewModel>().greenDotsNumber == 4)
                ? SvgPicture.asset(MyIcons.touchId)
                : Text("OK", style: MyTextStyle.light20.copyWith(color: MyColors.basicWhite)),
        ),
      );
    } else if (index == 11) {
      return CircleAvatar(
        backgroundColor: MyColors.basicBlack,
        child: Center(child: SvgPicture.asset(MyIcons.back)
        ),
      );
    } else {
      return CircleAvatar(
        backgroundColor: MyColors.gray6,
        child: Center(
          child: Text(
            (index != 10) ? (index + 1).toString() : 0.toString(),
            style: MyTextStyle.light32.copyWith(color: MyColors.basicWhite),
          ),
        ),
      );
    }
  }
}
