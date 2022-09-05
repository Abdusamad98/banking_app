import 'package:json_annotation/json_annotation.dart';

part 'income_type.g.dart';

@JsonSerializable(explicitToJson: true)
class IncomeType {
  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "income_type")
  String incomeType;

  IncomeType({
    required this.id,
    required this.incomeType,
  });

  factory IncomeType.fromJson(Map<String, dynamic> json) => _$IncomeTypeFromJson(json);
  Map<String, dynamic> toJson() => _$IncomeTypeToJson(this);
}