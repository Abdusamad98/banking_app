import 'package:json_annotation/json_annotation.dart';

part 'expense_type.g.dart';

@JsonSerializable(explicitToJson: true)
class ExpenseType {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "expense_type")
  String expenseType;

  ExpenseType({
    required this.id,
    required this.expenseType,
  });

  factory ExpenseType.fromJson(Map<String, dynamic> json) => _$ExpenseTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseTypeToJson(this);
}