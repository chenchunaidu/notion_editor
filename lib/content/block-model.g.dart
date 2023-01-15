// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockModel _$BlockModelFromJson(Map<String, dynamic> json) => BlockModel(
      blockType: $enumDecode(_$BlockTypesEnumMap, json['blockType']),
      blockProps: json['blockProps'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$BlockModelToJson(BlockModel instance) =>
    <String, dynamic>{
      'blockType': _$BlockTypesEnumMap[instance.blockType]!,
      'blockProps': instance.blockProps,
    };

const _$BlockTypesEnumMap = {
  BlockTypes.text: 'text',
  BlockTypes.image: 'image',
  BlockTypes.listItem: 'listItem',
};
