import 'package:banking_app/data/models/transactions/incomes/income_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'income.g.dart';

@JsonSerializable()
class Income {
  @JsonKey(defaultValue: "", name: "transfer_date")
  String transferDate;

  @JsonKey(name: "data")
  List<IncomeData> data;

  Income({
    required this.transferDate,
    required this.data,
  });

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);
  Map<String, dynamic> toJson() => _$IncomeToJson(this);
}