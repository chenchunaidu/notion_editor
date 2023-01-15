// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content-editor-state-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentEditorStateModel _$ContentEditorStateModelFromJson(
        Map<String, dynamic> json) =>
    ContentEditorStateModel(
      blocks: (json['blocks'] as List<dynamic>)
          .map((e) => BlockModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentEditorStateModelToJson(
        ContentEditorStateModel instance) =>
    <String, dynamic>{
      'blocks': instance.blocks,
    };
