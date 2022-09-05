// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      transactionCode: json['transaction_code'] as int? ?? 0,
      date: json['date'] as String? ?? '',
      expenseId: json['expense_id'] as int? ?? 0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      cardId: json['card_id'] as int? ?? 0,
      receiver: Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'transaction_code': instance.transactionCode,
      'date': instance.date,
      'expense_id': instance.expenseId,
      'amount': instance.amount,
      'card_id': instance.cardId,
      'receiver': instance.receiver.toJson(),
    };
