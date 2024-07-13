import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    this.name,
    this.company,
    this.location,
    this.limitStartDate,
    this.limitEndDate,
  });

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "company")
  String? company;

  @JsonKey(name: "location")
  String? location;

  @JsonKey(name: "limitStartDate")
  String? limitStartDate;

  @JsonKey(name: "limitEndDate")
  String? limitEndDate;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
