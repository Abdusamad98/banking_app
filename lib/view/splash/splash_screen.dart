import 'package:banking_app/data/local_data/storage.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/icons.dart';
import 'package:banking_app/view/login/login/login_screen.dart';
import 'package:banking_app/view/security/security_screen.dart';
import 'package:banking_app/view/tabs/tab_box.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _init() async {
    await StorageRepository.getInstance();
  }

  @override
  initState() {
    _init();
    Future.delayed(const Duration(seconds: 2), () {
      bool isLogged = StorageRepository.getBool("isLogged");
      debugPrint("logged: $isLogged");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return (isLogged) ? const SecurityScreen() : const LoginScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(child: Lottie.asset(MyIcons.bank, repeat: false)),
    );
  }
}

