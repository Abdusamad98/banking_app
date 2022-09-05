// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sender _$SenderFromJson(Map<String, dynamic> json) => Sender(
      brandImage: json['brand_image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );

Map<String, dynamic> _$SenderToJson(Sender instance) => <String, dynamic>{
      'brand_image': instance.brandImage,
      'name': instance.name,
      'location': instance.location,
    };
