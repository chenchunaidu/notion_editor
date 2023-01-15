import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:notion_editor/common/image-upload-model.dart';
import 'package:notion_editor/common/image-upload-placeholder.dart';
import 'package:notion_editor/common/image/image.dart';
import 'package:notion_editor/common/typography/index.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';
import '../content/content-editor.dart';

enum ImageUploadState { idle, inProgress, success, error }

class ImageUpload extends StatefulWidget {
  const ImageUpload({
    Key? key,
    required this.props,
    required this.onUpdate,
  }) : super(key: key);

  final UpdateBlockCallback onUpdate;
  final ImageUploadModel props;

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  String imageUrl = '';
  ImageUploadState uploadState = ImageUploadState.idle;

  final ImagePicker _picker = ImagePicker();

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );

      if (pickedFile?.path != null) {
        var file = File(pickedFile?.path ?? '');
      }
    } catch (e) {
      setState(() {
        uploadState = ImageUploadState.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.props.imageUrl != null) {
      return CustomImage(image: NetworkImage(widget.props.imageUrl ?? ""));
    } else if (uploadState == ImageUploadState.inProgress) {
      return const ImageUploadPlaceholder(
          imageUrl: "assets/placeholders/image-placeholder.png",
          child: CircularProgressIndicator(
            semanticsLabel: 'Circular progress indicator',
          ));
    } else if (uploadState == ImageUploadState.error) {
      return const ImageUploadPlaceholder(
          imageUrl: "assets/placeholders/broken-image.png",
          child: CustomTypography("Error occurred while uploading image"));
    }

    return OutlinedButton(
        onPressed: () {
          _onImageButtonPressed(ImageSource.gallery, context: context);
        },
        child: Column(
          children: const [
            ImageUploadPlaceholder(
              imageUrl: "assets/placeholders/image-placeholder.png",
            ),
            CustomTypography("Upload Image")
          ],
        ));
  }
}

class ImageUploadWrapper extends StatelessWidget {
  const ImageUploadWrapper(
      {Key? key,
      required this.props,
      required this.onUpdate,
      required this.onFocus})
      : super(key: key);

  final UpdateBlockCallback onUpdate;
  final ImageUploadModel props;
  final void Function() onFocus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFocus,
      child: ImageUpload(
        props: props,
        onUpdate: onUpdate,
      ),
    );
  }
}
