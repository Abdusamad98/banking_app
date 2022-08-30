import 'package:banking_app/data/models/auth_state.dart';
import 'package:banking_app/data/models/register_data.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/constants.dart';
import 'package:banking_app/utils/icons.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:banking_app/utils/utility_functions.dart';
import 'package:banking_app/view_model/auth_view_model.dart';
import 'package:banking_app/widgets/button.dart';
import 'package:banking_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authState = context.watch<AuthViewModel>().authState;
    if (authState == AuthState.REGISTERED) {
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, loginRoute);
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
                Lottie.asset(MyIcons.register),
                const SizedBox(height: 20),
                Text("Register",
                    style: MyTextStyle.semiBold20
                        .copyWith(color: MyColors.basicWhite, fontSize: 28)),
                const SizedBox(height: 15),
                MyTextField(
                  controller: nameController,
                  hintText: "Name",
                  prefixIcon: const Icon(Icons.person_outline,
                      color: MyColors.basicWhite),
                ),
                const SizedBox(height: 12),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined,
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
                const SizedBox(height: 12),
                MyTextField(
                  controller: confirmController,
                  hintText: "Confirm Password",
                  prefixIcon: const Icon(Icons.lock_outline,
                      color: MyColors.basicWhite),
                  suffixIcon: const Icon(Icons.remove_red_eye,
                      color: MyColors.basicWhite),
                ),
                const Expanded(child: SizedBox()),
                MyButton(
                  onPressed: () {
                    var name = nameController.text;
                    var email = emailController.text;
                    var password = passwordController.text;
                    var confirm = confirmController.text;

                    if (name.isNotEmpty &&
                        email.isNotEmpty &&
                        password.isNotEmpty &&
                        confirm.isNotEmpty) {
                      context.read<AuthViewModel>().registerUser(
                            registerData: RegisterData(
                              firstName: name,
                              lastName: name,
                              password: password,
                              email: email,
                            ),
                          );
                    } else {
                      UtilityFunctions.getMyToast(message: "Xato");
                    }
                  },
                  buttonText: "Register",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
