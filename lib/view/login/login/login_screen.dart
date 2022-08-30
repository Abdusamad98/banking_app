import 'package:banking_app/data/models/auth_state.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/constants.dart';
import 'package:banking_app/utils/icons.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:banking_app/utils/utility_functions.dart';
import 'package:banking_app/view/login/register/register_screen.dart';
import 'package:banking_app/view_models/auth_view_model.dart';
import 'package:banking_app/widgets/button.dart';
import 'package:banking_app/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool switched = context.watch<AuthViewModel>().switched;
    var authState = context.watch<AuthViewModel>().authState;
    if (authState == AuthState.LOGGED) {
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, setPinRoute);
      });
    }
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - 50,
            padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
            child: Column(
              children: [
                Lottie.asset(MyIcons.login),
                Text("Login",
                    style: MyTextStyle.semiBold20
                        .copyWith(color: MyColors.basicWhite, fontSize: 28)),
                const SizedBox(height: 15),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.mail_outline,
                      color: MyColors.basicWhite),
                ),
                const SizedBox(height: 12),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline,
                      color: MyColors.basicWhite),
                  suffixIcon: const Icon(Icons.remove_red_eye,
                      color: MyColors.basicWhite),
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: switched,
                            onChanged: (v) {
                              context.read<AuthViewModel>().onSwitchPressed();
                            },
                            activeColor: MyColors.basicWhite,
                            thumbColor: (!switched)
                                ? MyColors.basicWhite
                                : MyColors.basicBlack,
                            trackColor: Colors.red,
                          ),
                        ),
                        Text(
                          "Remember Me",
                          style: MyTextStyle.regular14.copyWith(
                            color: MyColors.basicWhite,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Forgot Password?",
                      style: MyTextStyle.regular14.copyWith(
                        color: MyColors.basicWhite,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                MyButton(
                    onPressed: () {
                      String email = emailController.text;
                      String password = passwordController.text;
                      if (email.length > 10 && password.length > 4) {
                        context.read<AuthViewModel>().loginUser(
                              email: email,
                              password: password,
                            );
                      } else {
                        UtilityFunctions.getMyToast(
                            message: "Email yoki password xato!");
                      }
                    },
                    buttonText: "Login"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RegisterScreen()));
                  },
                  child: Text("Register now",
                      style: MyTextStyle.regular14.copyWith(
                          color: MyColors.basicWhite,
                          fontSize: 12,
                          fontStyle: FontStyle.italic)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
