import 'package:notion_editor/common/typography/index.dart';
import 'package:flutter/widgets.dart';

class ImageErrorBuilder extends StatelessWidget {
  const ImageErrorBuilder(
      {Key? key, this.semanticLabel, this.height, this.width})
      : super(key: key);

  final String? semanticLabel;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Stack(children: [
          const Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/placeholder.png'),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(6),
            child: CustomTypography(semanticLabel ?? '', as: "Caption"),
          ),
        ]));
    ;
  }
}
