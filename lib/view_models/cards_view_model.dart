import 'package:banking_app/data/models/user_card.dart';
import 'package:banking_app/data/repositories/cards_repository.dart';
import 'package:flutter/cupertino.dart';

class CardsViewModel extends ChangeNotifier {
  CardsViewModel({required this.cardsRepository}){
    fetchUserCards();
  }

  final CardsRepository cardsRepository;

  List<UserCard> _userCards = [];

  List<UserCard> get getUserCards => _userCards;

  bool isLoading = false;

  Future<void> fetchUserCards() async {
    notify(true);
    _userCards = await cardsRepository.fetchUserCards();
    notify(true);
  }

  void notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
