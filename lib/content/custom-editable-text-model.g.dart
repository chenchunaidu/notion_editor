// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom-editable-text-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomEditableTextModel _$CustomEditableTextModelFromJson(
        Map<String, dynamic> json) =>
    CustomEditableTextModel(
      typography: json['typography'] as String? ?? "Body",
      text: json['text'] as String? ?? "",
    );

Map<String, dynamic> _$CustomEditableTextModelToJson(
        CustomEditableTextModel instance) =>
    <String, dynamic>{
      'typography': instance.typography,
      'text': instance.text,
    };
