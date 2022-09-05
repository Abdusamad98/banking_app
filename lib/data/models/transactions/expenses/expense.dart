import 'package:banking_app/data/models/transactions/expenses/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense.g.dart';

@JsonSerializable()
class Expense {
  @JsonKey(defaultValue: "", name: "transfer_date")
  String transferDate;

  @JsonKey(name: "data")
  List<Data> data;

  Expense({
    required this.transferDate,
    required this.data,
  });

  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}