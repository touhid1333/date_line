import 'package:date_line/data/models/workSchedules/work_schedule_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_schedule_response.g.dart';

@JsonSerializable()
class WorkScheduleResponse {
  @JsonKey(name: "data")
  List<WorkScheduleModel>? data;

  WorkScheduleResponse({
    this.data,
  });

  factory WorkScheduleResponse.fromJson(Map<String, dynamic> json) => _$WorkScheduleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkScheduleResponseToJson(this);
}