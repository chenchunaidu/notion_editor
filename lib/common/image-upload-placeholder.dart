import 'package:notion_editor/common/image/image.dart';
import 'package:flutter/widgets.dart';

class ImageUploadPlaceholder extends StatelessWidget {
  const ImageUploadPlaceholder({Key? key, required this.imageUrl, this.child})
      : super(key: key);

  final String imageUrl;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        CustomImage(
          image: AssetImage(imageUrl),
          borderRadius: 6,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned.fill(
          child: Align(alignment: Alignment.center, child: child),
        ),
      ],
    ));
  }
}
