import 'package:banking_app/data/models/auth_state.dart';
import 'package:banking_app/utils/icons.dart';
import 'package:banking_app/view/login/login/login_screen.dart';
import 'package:banking_app/view/login/register/register_screen.dart';
import 'package:banking_app/view/set_pin/set_pin_screen.dart';
import 'package:banking_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var authState = context.watch<AuthViewModel>().authState;
    print("created");
    print(authState);
    navigateToScreen(authState);

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Consumer<AuthViewModel>(builder: (c, d, ch) {
          return d.isLoading
              ? Center(child: Lottie.asset(MyIcons.bank, repeat: false))
              : const SizedBox();
        }));
  }

  Future<void> navigateToScreen(AuthState authState) async {
   await Future.delayed(Duration.zero);
    switch (authState) {
      case AuthState.REGISTERED:
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return LoginScreen();
          }));
        }
        break;
      case AuthState.LOGGED:
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return SetPinScreen();
          }));
        }
        break;
      case AuthState.NOT_REGISTERED:
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return RegisterScreen();
          }));
        }
        break;
      case AuthState.PURE:
        break;
    }
  }
}
