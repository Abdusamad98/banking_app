import 'package:json_annotation/json_annotation.dart';

part 'sender.g.dart';

@JsonSerializable(explicitToJson: true)
class Sender {
  @JsonKey(defaultValue: "", name: "brand_image")
  String brandImage;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "location")
  String location;

  Sender({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);
  Map<String, dynamic> toJson() => _$SenderToJson(this);
}