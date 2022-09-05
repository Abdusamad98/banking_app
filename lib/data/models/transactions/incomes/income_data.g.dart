// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeData _$IncomeDataFromJson(Map<String, dynamic> json) => IncomeData(
      transactionCode: json['transaction_code'] as int? ?? 0,
      date: json['date'] as String? ?? '',
      incomeId: json['income_id'] as int? ?? 0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      cardId: json['card_id'] as int? ?? 0,
      sender: Sender.fromJson(json['sender'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IncomeDataToJson(IncomeData instance) =>
    <String, dynamic>{
      'transaction_code': instance.transactionCode,
      'date': instance.date,
      'income_id': instance.incomeId,
      'amount': instance.amount,
      'card_id': instance.cardId,
      'sender': instance.sender.toJson(),
    };
