import 'package:banking_app/data/local_data/storage.dart';
import 'package:banking_app/data/models/register_data.dart';
import 'package:banking_app/data/services/open_api_service.dart';

class AuthRepository {
  AuthRepository({required this.openApiService});

  OpenApiService openApiService;

  Future<bool> registerUser(RegisterData registerData) =>
      openApiService.registerUser(registerData: registerData);

  Future<String> loginUser(String email, String password) =>
      openApiService.loginUser(password: password, email: email);

  Future<void> saveToken(String token) async {
    await StorageRepository.putString(key: "access_token", value: token);
  }

  Future<void> saveUserData(RegisterData registerData) async {
    await StorageRepository.putString(key: "first_name", value: registerData.firstName);
    await StorageRepository.putString(key: "last_name", value: registerData.lastName);
    await StorageRepository.putString(key: "email", value: registerData.email);
    await StorageRepository.putString(key: "password", value: registerData.password);
  }
}
