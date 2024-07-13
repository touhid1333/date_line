import 'package:json_annotation/json_annotation.dart';

part 'work_schedule_model.g.dart';

@JsonSerializable()
class WorkScheduleModel {
  @JsonKey(name: "date", fromJson: dateFromJson)
  DateTime? date;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "location")
  String? location;

  WorkScheduleModel({
    this.date,
    this.name,
    this.category,
    this.location,
  });

  factory WorkScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$WorkScheduleModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkScheduleModelToJson(this);

  static DateTime? dateFromJson(String? value) {
    int? timeStamp = int.tryParse(value ?? "");
    return timeStamp == null ? null : DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  }
}
