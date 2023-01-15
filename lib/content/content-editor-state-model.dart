import 'package:notion_editor/content/block-model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'content-editor-state-model.g.dart';

@JsonSerializable()
class ContentEditorStateModel {
  final List<BlockModel> blocks;
  ContentEditorStateModel({required this.blocks});

  factory ContentEditorStateModel.fromJson(Map<String, dynamic> json) =>
      _$ContentEditorStateModelFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'blocks': blocks.map((e) => e.toJson()).toList(),
      };
}
