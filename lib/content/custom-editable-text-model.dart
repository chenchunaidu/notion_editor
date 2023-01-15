import 'package:json_annotation/json_annotation.dart';
part 'custom-editable-text-model.g.dart';

@JsonSerializable()
class CustomEditableTextModel {
  final String? typography;
  final String? text;

  CustomEditableTextModel({this.typography = "Body", this.text = ""});

  factory CustomEditableTextModel.fromJson(Map<String, dynamic> json) =>
      _$CustomEditableTextModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomEditableTextModelToJson(this);
}
