import 'dart:convert';
import 'package:banking_app/data/local_data/storage.dart';
import 'package:banking_app/data/models/register_data.dart';
import 'package:banking_app/data/models/user_card.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as https;

class SecureApiService {
  Future<List<UserCard>> getUserCards() async {
    String token = StorageRepository.getString("access_token");
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
}
