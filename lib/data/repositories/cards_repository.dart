import 'package:banking_app/data/models/user_card.dart';
import 'package:banking_app/data/services/secure_api_service.dart';

class CardsRepository {
  CardsRepository({required this.secureApiService});

  final SecureApiService secureApiService;

  Future<List<UserCard>> fetchUserCards() => secureApiService.getUserCards();
}
