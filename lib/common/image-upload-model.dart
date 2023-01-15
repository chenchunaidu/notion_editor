import 'package:json_annotation/json_annotation.dart';
part 'image-upload-model.g.dart';

@JsonSerializable()
class ImageUploadModel {
  final String? imageUrl;

  ImageUploadModel({this.imageUrl});
  factory ImageUploadModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return _$ImageUploadModelFromJson(json);
    }
    return ImageUploadModel();
  }

  Map<String, dynamic> toJson() => _$ImageUploadModelToJson(this);
}
