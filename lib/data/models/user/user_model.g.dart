// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String?,
      company: json['company'] as String?,
      location: json['location'] as String?,
      limitStartDate: json['limitStartDate'] as String?,
      limitEndDate: json['limitEndDate'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'company': instance.company,
      'location': instance.location,
      'limitStartDate': instance.limitStartDate,
      'limitEndDate': instance.limitEndDate,
    };
