import 'package:banking_app/data/local_data/storage.dart';
import 'package:banking_app/data/models/auth_state.dart';
import 'package:banking_app/data/models/register_data.dart';
import 'package:banking_app/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({required this.authRepository}) {
    _init();
  }

  final AuthRepository authRepository;

  bool switched = false;
  bool isLoading = false;

  AuthState authState = AuthState.PURE;

  Future<void> _init() async {
    notify(true);
    await StorageRepository.getInstance();
    await Future.delayed(const Duration(seconds: 2), () {
      checkAuhState();
    });
    notify(false);
  }

  void checkAuhState() {
    if (StorageRepository.getString("first_name").isNotEmpty) {
      if (StorageRepository.getString("access_token").isNotEmpty) {
        authState = AuthState.LOGGED;
      } else {
        authState = AuthState.REGISTERED;
      }
    } else {
      authState = AuthState.NOT_REGISTERED;
    }
    print("AUTH STATE UPDATED");
  }

  void loginUser({
    required String email,
    required String password,
  }) async {
    notify(true);
    String token = await authRepository.loginUser(email, password);
    await authRepository.saveToken(token);
    authState = AuthState.LOGGED;
    print("USER LOGGED");
    notify(false);
  }

  void registerUser({
    required RegisterData registerData,
  }) async {
    notify(true);
    bool isRegistered = await authRepository.registerUser(registerData);
    if (isRegistered) {
      authState = AuthState.REGISTERED;
      await authRepository.saveUserData(registerData);
      print("USER REGISTERED");
    }
    notify(false);
  }

  void onSwitchPressed() {
    switched = !switched;
    notifyListeners();
  }

  void notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
