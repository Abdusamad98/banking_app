import 'package:banking_app/utils/constants.dart';
import 'package:banking_app/view/login/login/login_screen.dart';
import 'package:banking_app/view/login/register/register_screen.dart';
import 'package:banking_app/view/set_pin/set_pin_screen.dart';
import 'package:banking_app/view/splash/splash_screen.dart';
import 'package:banking_app/view/tabs/tab_box.dart';
import 'package:banking_app/view/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case tabRoute:
        return MaterialPageRoute(builder: (_) => TabBox());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case setPinRoute:
        return MaterialPageRoute(builder: (_) => SetPinScreen());
      case transactionsRoute:
        return MaterialPageRoute(builder: (_) => TransactionsScreen());


      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
