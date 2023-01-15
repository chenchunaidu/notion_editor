// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content-block-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentBlockModel _$ContentBlockModelFromJson(Map<String, dynamic> json) =>
    ContentBlockModel(
      blockType: $enumDecode(_$BlockTypesEnumMap, json['blockType']),
      blockProps: json['blockProps'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ContentBlockModelToJson(ContentBlockModel instance) =>
    <String, dynamic>{
      'blockType': _$BlockTypesEnumMap[instance.blockType]!,
      'blockProps': instance.blockProps,
    };

const _$BlockTypesEnumMap = {
  BlockTypes.text: 'text',
  BlockTypes.image: 'image',
  BlockTypes.listItem: 'listItem',
};
