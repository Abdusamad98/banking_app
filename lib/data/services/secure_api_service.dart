import 'dart:convert';
import 'package:banking_app/data/local_data/storage.dart';
import 'package:banking_app/data/models/transactions/expenses/expense.dart';
import 'package:banking_app/data/models/transactions/incomes/income.dart';
import 'package:banking_app/data/models/user_card.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;

class SecureApiService {
  String token = StorageRepository.getString("access_token");

  Future<List<UserCard>> getUserCards() async {
    try {
      Response response = await https.get(
          Uri.parse("https://banking-api.free.mockoapp.net/user_cards"),
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        List<UserCard> userCards = (jsonDecode(response.body) as List?)
                ?.map((e) => UserCard.fromJson(e))
                .toList() ??
            [];
        return userCards;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Expense>> getExpenses() async {
    try {
      Response response = await https.get(
        Uri.parse(
            "https://banking-api.free.mockoapp.net/transactions-expenses"),
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        List<Expense> expenses = (jsonDecode(response.body) as List?)
                ?.map((e) => Expense.fromJson(e))
                .toList() ??
            [];
        return expenses;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<List<Income>> getIncomes() async {
    try {
      Response response = await https.get(
        Uri.parse("https://banking-api.free.mockoapp.net/transactions-incomes"),
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        List<Income> incomes = (jsonDecode(response.body) as List?)
                ?.map((e) => Income.fromJson(e))
                .toList() ??
            [];
        return incomes;
      } else {
        throw Exception();
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }


}
