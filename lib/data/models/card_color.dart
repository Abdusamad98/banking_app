import 'package:json_annotation/json_annotation.dart';

part 'card_color.g.dart';

@JsonSerializable(explicitToJson: true)
class CardColor {
  @JsonKey(defaultValue: "", name: "color_a")
  String colorA;

  @JsonKey(defaultValue: "", name: "color_b")
  String colorB;

  CardColor({
    required this.colorA,
    required this.colorB,
  });

  factory CardColor.fromJson(Map<String, dynamic> json) =>
      _$CardColorFromJson(json);

  Map<String, dynamic> toJson() => _$CardColorToJson(this);
}
