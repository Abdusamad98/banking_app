// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Income _$IncomeFromJson(Map<String, dynamic> json) => Income(
      transferDate: json['transfer_date'] as String? ?? '',
      data: (json['data'] as List<dynamic>)
          .map((e) => IncomeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IncomeToJson(Income instance) => <String, dynamic>{
      'transfer_date': instance.transferDate,
      'data': instance.data,
    };
