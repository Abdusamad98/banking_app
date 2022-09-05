import 'package:banking_app/data/models/transactions/expenses/receiver.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  @JsonKey(defaultValue: 0, name: "transaction_code")
  int transactionCode;

  @JsonKey(defaultValue: "", name: "date")
  String date;

  @JsonKey(defaultValue: 0, name: "expense_id")
  int expenseId;

  @JsonKey(defaultValue: 0.0, name: "amount")
  double amount;

  @JsonKey(defaultValue: 0, name: "card_id")
  int cardId;

  @JsonKey(name: "receiver")
  Receiver receiver;

  Data({
    required this.transactionCode,
    required this.date,
    required this.expenseId,
    required this.amount,
    required this.cardId,
    required this.receiver,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}