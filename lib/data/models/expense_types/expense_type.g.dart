// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseType _$ExpenseTypeFromJson(Map<String, dynamic> json) => ExpenseType(
      id: json['id'] as int? ?? 0,
      expenseType: json['expense_type'] as String? ?? '',
    );

Map<String, dynamic> _$ExpenseTypeToJson(ExpenseType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expense_type': instance.expenseType,
    };
