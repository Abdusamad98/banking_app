import 'dart:convert';
import 'package:banking_app/data/models/expense_types/expense_type.dart';
import 'package:banking_app/data/models/income_types/income_type.dart';
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

  Future<List<ExpenseType>> getExpenseTypes() async {
    try {
      Response res = await https.get(
          Uri.parse("https://banking-api.free.mockoapp.net/expense-types"));

      if (res.statusCode == 200) {
        List<ExpenseType> expenseTypes = (jsonDecode(res.body) as List?)
            ?.map((e) => ExpenseType.fromJson(e))
            .toList() ??
            [];
        return expenseTypes;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<List<IncomeType>> getIncomeTypes() async {
    try {
      Response res = await https.get(
          Uri.parse("https://banking-api.free.mockoapp.net/income-types"));

      if (res.statusCode == 200) {
        List<IncomeType> incomeTypes = (jsonDecode(res.body) as List?)
            ?.map((e) => IncomeType.fromJson(e))
            .toList() ??
            [];
        return incomeTypes;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
