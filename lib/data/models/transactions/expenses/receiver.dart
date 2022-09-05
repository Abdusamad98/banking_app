import 'package:json_annotation/json_annotation.dart';

part 'receiver.g.dart';

@JsonSerializable(explicitToJson: true)
class Receiver {
  @JsonKey(defaultValue: "", name: "brand_image")
  String brandImage;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "location")
  String location;

  Receiver({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => _$ReceiverFromJson(json);
  Map<String, dynamic> toJson() => _$ReceiverToJson(this);
}