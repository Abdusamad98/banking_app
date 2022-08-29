import 'package:banking_app/data/local_data/storage.dart';
import 'package:banking_app/utils/utility_functions.dart';
import 'package:banking_app/view/tabs/tab_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityViewModel extends ChangeNotifier {
  int greenDotsNumber = 0;
  String password = "";
  bool setPinCode = false;


  void onGestureTap({required int listLength, required int index, required BuildContext context}) async{
    if (index != 11) {
      if (greenDotsNumber < listLength) {
        greenDotsNumber++;
        if (password.length < 4 && index != 9 && index != 10) {
          password += (index + 1).toString();
        } else if (index == 10) {
          password += "0";
        }
        notifyListeners();
      }
    }
    else {
      if (greenDotsNumber > 0) {
        greenDotsNumber--;
        if (password.isNotEmpty) {
          password = password.substring(0, greenDotsNumber);
        }
      }
      notifyListeners();
    }


    if (greenDotsNumber == 4 && index == 9){

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const TabBox()));
      UtilityFunctions.getMyToast(message: "Your passcode: ${StorageRepository.getString("passcode")}");

      await StorageRepository.putString(key: "passcode", value: password);
    }
  }
}
