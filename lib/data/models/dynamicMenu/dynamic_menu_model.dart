import 'package:json_annotation/json_annotation.dart';

part 'dynamic_menu_model.g.dart';

@JsonSerializable()
class DynamicMenuModel {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "fileUrl")
  String? fileUrl;

  DynamicMenuModel({
    this.id,
    this.name,
    this.fileUrl,
  });

  factory DynamicMenuModel.fromJson(Map<String, dynamic> json) => _$DynamicMenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$DynamicMenuModelToJson(this);
}
