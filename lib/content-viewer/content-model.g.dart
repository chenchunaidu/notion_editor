// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentViewerModel _$ContentViewerModelFromJson(Map<String, dynamic> json) =>
    ContentViewerModel(
      blocks: (json['blocks'] as List<dynamic>)
          .map((e) => ContentBlockModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentViewerModelToJson(ContentViewerModel instance) =>
    <String, dynamic>{
      'blocks': instance.blocks,
    };
