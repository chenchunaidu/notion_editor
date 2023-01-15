import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.icon,
      this.onPressed,
      this.backgroundColor = Colors.white})
      : super(key: key);

  final Icon icon;
  final void Function()? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: this.backgroundColor,
        child: IconButton(
            icon: icon, padding: EdgeInsets.all(0), onPressed: onPressed));
  }
}
