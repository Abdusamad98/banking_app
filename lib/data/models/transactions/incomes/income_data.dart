import 'package:banking_app/data/models/transactions/incomes/sender.dart';
import 'package:json_annotation/json_annotation.dart';

part 'income_data.g.dart';

@JsonSerializable(explicitToJson: true)
class IncomeData {
  @JsonKey(defaultValue: 0, name: "transaction_code")
  int transactionCode;

  @JsonKey(defaultValue: "", name: "date")
  String date;

  @JsonKey(defaultValue: 0, name: "income_id")
  int incomeId;

  @JsonKey(defaultValue: 0.0, name: "amount")
  double amount;

  @JsonKey(defaultValue: 0, name: "card_id")
  int cardId;

  @JsonKey(name: "sender")
  Sender sender;

  IncomeData({
    required this.transactionCode,
    required this.date,
    required this.incomeId,
    required this.amount,
    required this.cardId,
    required this.sender,
  });

  factory IncomeData.fromJson(Map<String, dynamic> json) => _$IncomeDataFromJson(json);
  Map<String, dynamic> toJson() => _$IncomeDataToJson(this);
}