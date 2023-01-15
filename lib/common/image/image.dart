import 'package:flutter/material.dart';

import 'image-error-builder.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {Key? key,
      required this.image,
      this.frameBuilder,
      this.loadingBuilder,
      this.errorBuilder,
      this.semanticLabel,
      this.excludeFromSemantics = false,
      this.width,
      this.height,
      this.color,
      this.opacity,
      this.colorBlendMode,
      this.fit,
      this.alignment = Alignment.center,
      this.repeat = ImageRepeat.noRepeat,
      this.centerSlice,
      this.matchTextDirection = false,
      this.gaplessPlayback = false,
      this.isAntiAlias = false,
      this.filterQuality = FilterQuality.low,
      this.borderRadius = 0})
      : super(key: key);

  final ImageProvider<Object> image;
  final ImageFrameBuilder? frameBuilder;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageErrorWidgetBuilder? errorBuilder;
  final double? width;
  final double? height;
  final Color? color;
  final Animation<double>? opacity;
  final FilterQuality filterQuality;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final Rect? centerSlice;
  final bool matchTextDirection;
  final bool gaplessPlayback;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final bool isAntiAlias;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image(
        image: image,
        color: color,
        frameBuilder: frameBuilder,
        loadingBuilder: loadingBuilder,
        errorBuilder: (context, error, stackTrace) {
          return ImageErrorBuilder(
            width: width,
            height: height,
            semanticLabel: semanticLabel,
          );
        },
        width: width,
        height: height,
        opacity: opacity,
        filterQuality: filterQuality,
        colorBlendMode: colorBlendMode,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        centerSlice: centerSlice,
        matchTextDirection: matchTextDirection,
        gaplessPlayback: gaplessPlayback,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        isAntiAlias: isAntiAlias,
      ),
    );
  }
}
