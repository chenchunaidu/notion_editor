import 'package:flutter/material.dart';

class FullPageCarousel extends StatelessWidget {
  FullPageCarousel({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: children,
    );
  }
}
