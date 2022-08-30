import 'package:banking_app/data/models/card_color.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_card.g.dart';

@JsonSerializable()
class UserCard {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "card_type")
  String cardType;

  @JsonKey(defaultValue: "", name: "card_number")
  String cardNumber;

  @JsonKey(defaultValue: "", name: "bank_name")
  String bankName;

  @JsonKey(defaultValue: 0.0, name: "money_amount")
  double moneyAmount;

  @JsonKey(defaultValue: "", name: "card_crrency")
  String cardCurrency;

  @JsonKey(defaultValue: "", name: "expire_date")
  String expireDate;

  @JsonKey(defaultValue: "", name: "icon_image")
  String iconImage;

  @JsonKey(name: "colors")
  CardColor colors;

  UserCard({
    required this.id,
    required this.bankName,
    required this.cardCurrency,
    required this.cardNumber,
    required this.cardType,
    required this.colors,
    required this.expireDate,
    required this.iconImage,
    required this.moneyAmount,
  });

  factory UserCard.fromJson(Map<String, dynamic> json) =>
      _$UserCardFromJson(json);

  Map<String, dynamic> toJson() => _$UserCardToJson(this);
}
