// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkScheduleResponse _$WorkScheduleResponseFromJson(
        Map<String, dynamic> json) =>
    WorkScheduleResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WorkScheduleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkScheduleResponseToJson(
        WorkScheduleResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
