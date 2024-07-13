// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkScheduleModel _$WorkScheduleModelFromJson(Map<String, dynamic> json) =>
    WorkScheduleModel(
      date: WorkScheduleModel.dateFromJson(json['date'] as String?),
      name: json['name'] as String?,
      category: json['category'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$WorkScheduleModelToJson(WorkScheduleModel instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'name': instance.name,
      'category': instance.category,
      'location': instance.location,
    };
