import 'package:banking_app/data/local_data/storage.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:banking_app/view/set_pin/widgets/custom_keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class UpdatePinScreen extends StatefulWidget {
  const UpdatePinScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePinScreen> createState() => _UpdatePinScreenState();
}

class _UpdatePinScreenState extends State<UpdatePinScreen> {
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  String savedPinCode = "";

  @override
  void initState() {
    savedPinCode = StorageRepository.getString("pin_code");
    print("SAVED PIN CODE:$savedPinCode");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 42,
      height: 42,
      textStyle: TextStyle(
          fontSize: 36, color: Theme.of(context).textTheme.headline1?.color),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: 42,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Pinput(
                      useNativeKeyboard: false,
                      showCursor: false,
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      onCompleted: (value) {
                        print(value);
                      },
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      preFilledWidget: Container(
                          margin: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: MyColors.green,
                          )),
                      followingPinTheme: defaultPinTheme,
                      pinAnimationType: PinAnimationType.scale,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            color: Colors.transparent,
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1,
              crossAxisSpacing: 36,
              mainAxisSpacing: 20,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map((e) {
                  return CustomKeyboardItem(
                    onTap: () {
                      if (_pinPutController.text.length < 4) {
                        _pinPutController.text = '${_pinPutController.text}$e';
                      }
                      if (_pinPutController.text.length == 4) {
                        checkPinLogic(pinCode: _pinPutController.text);
                      }
                    },
                    text: e.toString(),
                  );
                }),
                Text(
                  " ",
                  style: MyTextStyle.regular14.copyWith(fontSize: 36),
                ),
                CustomKeyboardItem(
                  onTap: () {
                    if (_pinPutController.text.length < 4) {
                      _pinPutController.text = '${_pinPutController.text}0';
                    }
                    if (_pinPutController.text.length == 4) {
                      checkPinLogic(pinCode: _pinPutController.text);
                    }
                  },
                  text: "0",
                ),
                TextButton(
                  onPressed: () {
                    if (_pinPutController.text.isNotEmpty) {
                      _pinPutController.text = _pinPutController.text
                          .substring(0, _pinPutController.text.length - 1);
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: MyColors.basicBlack,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.backspace_outlined,
                        size: 32,
                        color: Theme.of(context).textTheme.headline1?.color,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkPinLogic({required String pinCode}) {
    // if (savedPinCode.isEmpty) {
    //   Navigator.popAndPushNamed(context, confirmPinRoute, arguments: pinCode);
    // } else if (pinCode == savedPinCode) {
    //   Navigator.popAndPushNamed(context, tabsRoute);
    // } else {
    //   UtilityFunctions.getMyToast(message: "Pin code xato");
    // }
  }
}
