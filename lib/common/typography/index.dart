import 'package:flutter/material.dart';

var typographyStyles = {
  'Header1': const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
  ),
  'Header2': const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
  'Header3': const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
  'Title': const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  ),
  'TitleBold': const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  'Body': const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  'BodyBold': const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  'SmallText': const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
  ),
  'SmallTextBold': const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
  ),
  'Caption': const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
  ),
  'Button': const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  'Link': const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
};

class CustomTypography extends StatelessWidget {
  const CustomTypography(String this.data,
      {Key? key,
      this.color,
      this.as = 'Body',
      this.maxLines,
      this.overflow,
      this.textAlign})
      : super(key: key);

  final String? as;
  final String data;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: typographyStyles[this.as]?.copyWith(color: color, height: 1.5),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
