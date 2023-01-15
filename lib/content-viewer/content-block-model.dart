import 'package:notion_editor/common/image-upload-model.dart';
import 'package:notion_editor/common/image/image.dart';
import 'package:notion_editor/common/typography/index.dart';
import 'package:notion_editor/content-viewer/list-item.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../content/block-model.dart';
import '../content/custom-editable-text-model.dart';
part 'content-block-model.g.dart';

@JsonSerializable()
class ContentBlockModel {
  final BlockTypes blockType;
  final Map<String, dynamic> blockProps;

  ContentBlockModel({required this.blockType, required this.blockProps});

  Widget? getBlock() {
    if (blockType == BlockTypes.text) {
      CustomEditableTextModel props =
          CustomEditableTextModel.fromJson(blockProps);
      return CustomTypography(props.text ?? "", as: props.typography);
    } else if (blockType == BlockTypes.image) {
      return CustomImage(
          image: NetworkImage(
              ImageUploadModel.fromJson(blockProps).imageUrl ?? ""));
    } else if (blockType == BlockTypes.listItem) {
      CustomEditableTextModel props =
          CustomEditableTextModel.fromJson(blockProps);
      return ListItem(
        text: props.text,
      );
    }
    return null;
  }

  factory ContentBlockModel.fromJson(Map<String, dynamic> json) =>
      _$ContentBlockModelFromJson(json);
}
