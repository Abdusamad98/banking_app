import 'package:banking_app/data/models/auth_state.dart';
import 'package:banking_app/utils/constants.dart';
import 'package:banking_app/utils/icons.dart';
import 'package:banking_app/view_models/auth_view_model.dart';
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
    print("SPLASH BUILD CALLED");
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
    switch (authState) {
      case AuthState.REGISTERED:
        Future.microtask(() => Navigator.pushReplacementNamed(context, loginRoute));

        break;
      case AuthState.LOGGED:
        Future.microtask(() => Navigator.pushReplacementNamed(context, setPinRoute));

        break;
      case AuthState.NOT_REGISTERED:
        Future.microtask(() => Navigator.pushReplacementNamed(context, registerRoute));
        break;

      case AuthState.DEFAULT:
        break;
    }
  }
}
