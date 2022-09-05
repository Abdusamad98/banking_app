// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeType _$IncomeTypeFromJson(Map<String, dynamic> json) => IncomeType(
      id: json['id'] as int? ?? 0,
      incomeType: json['income_type'] as String? ?? '',
    );

Map<String, dynamic> _$IncomeTypeToJson(IncomeType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'income_type': instance.incomeType,
    };
