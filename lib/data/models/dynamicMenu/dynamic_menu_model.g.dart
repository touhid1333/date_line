// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicMenuModel _$DynamicMenuModelFromJson(Map<String, dynamic> json) =>
    DynamicMenuModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      fileUrl: json['fileUrl'] as String?,
    );

Map<String, dynamic> _$DynamicMenuModelToJson(DynamicMenuModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fileUrl': instance.fileUrl,
    };
