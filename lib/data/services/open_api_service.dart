import 'dart:convert';
import 'package:banking_app/data/models/register_data.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;



class OpenApiService {
  Future<bool> registerUser({required RegisterData registerData}) async {
    try {
      Response response = await https.post(
          Uri.parse("https://banking-api.free.mockoapp.net/register_user"),
          body: {
            "first_name": registerData.firstName,
            "last_name": registerData.lastName,
            "email": registerData.email,
            "password": registerData.password
          });
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["success"];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    try {
      Response response = await https.post(
          Uri.parse("https://banking-api.free.mockoapp.net/login"),
          body: {
            "email": email,
            "password": password,
          });
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["token"];
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
