import 'package:banking_app/data/local_data/storage.dart';
import 'package:banking_app/data/models/auth_state.dart';
import 'package:banking_app/data/models/register_data.dart';
import 'package:banking_app/data/repositories/auth_repository.dart';
import 'package:banking_app/data/services/open_api_service.dart';
import 'package:banking_app/utils/utility_functions.dart';
import 'package:banking_app/view/security/security_screen.dart';
import 'package:banking_app/view/tabs/tab_box.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({required this.authRepository});

  final AuthRepository authRepository;

  bool switched = false;
  bool isLoading = false;

  AuthState authState = AuthState.PURE;

  void onSwitchPressed() {
    switched = !switched;
    notifyListeners();
  }

  void checkLoggedIn() {
    if (StorageRepository.getString("access_token").isNotEmpty) {
      authState = AuthState.LOGGED;
      notifyListeners();
    }
  }

  void checkRegistered() {
    String savedFirstName = StorageRepository.getString("first_name");
    String savedLastName = StorageRepository.getString("last_name");
    if (savedFirstName.isNotEmpty && savedLastName.isNotEmpty) {
      authState = AuthState.REGISTERED;
    }
  }

  void onLoginPressed({
    required String email,
    required String password,
  }) async {
    notify(true);
    String token = await authRepository.loginUser(email, password);
    await authRepository.saveToken(token);
    authState = AuthState.LOGGED;
    notify(false);
  }

  void onRegisterPressed({
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

  void notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
