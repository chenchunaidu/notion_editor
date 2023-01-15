import 'package:notion_editor/common/image-upload-model.dart';
import 'package:notion_editor/common/image-upload.dart';
import 'package:notion_editor/content/custom-editable-text.dart';
import 'package:notion_editor/content/list-item-editable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'content-editor.dart';
import 'custom-editable-text-model.dart';
part 'block-model.g.dart';

enum BlockTypes { text, image, listItem }

enum TypographyTypes {
  Header1,
  Header2,
  Header3,
  Title,
  Body,
  SmallText,
  Caption,
}

@JsonSerializable()
class BlockModel {
  final BlockTypes blockType;
  final Map<String, dynamic> blockProps;

  BlockModel({required this.blockType, required this.blockProps});

  Widget? getBlock(void Function() onFocus, UpdateBlockCallback onUpdate) {
    if (blockType == BlockTypes.text) {
      return CustomEditableText(
        onFocus: onFocus,
        onUpdate: onUpdate,
        props: CustomEditableTextModel.fromJson(blockProps),
      );
    } else if (blockType == BlockTypes.image) {
      return ImageUploadWrapper(
        props: ImageUploadModel.fromJson(blockProps),
        onUpdate: onUpdate,
        onFocus: onFocus,
      );
    } else if (blockType == BlockTypes.listItem) {
      return ListItemEditable(
        props: CustomEditableTextModel.fromJson(blockProps),
        onUpdate: onUpdate,
        onFocus: onFocus,
      );
    }
    return null;
  }

  factory BlockModel.fromJson(Map<String, dynamic> json) =>
      _$BlockModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlockModelToJson(this);
}
