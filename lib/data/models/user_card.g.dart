// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCard _$UserCardFromJson(Map<String, dynamic> json) => UserCard(
      id: json['id'] as int? ?? 0,
      bankName: json['bank_name'] as String? ?? '',
      cardCurrency: json['card_crrency'] as String? ?? '',
      cardNumber: json['card_number'] as String? ?? '',
      cardType: json['card_type'] as String? ?? '',
      colors: CardColor.fromJson(json['colors'] as Map<String, dynamic>),
      expireDate: json['expire_date'] as String? ?? '',
      iconImage: json['icon_image'] as String? ?? '',
      moneyAmount: (json['money_amount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$UserCardToJson(UserCard instance) => <String, dynamic>{
      'id': instance.id,
      'card_type': instance.cardType,
      'card_number': instance.cardNumber,
      'bank_name': instance.bankName,
      'money_amount': instance.moneyAmount,
      'card_crrency': instance.cardCurrency,
      'expire_date': instance.expireDate,
      'icon_image': instance.iconImage,
      'colors': instance.colors,
    };
