import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/icon-button.dart';

class ExpandToolsButton extends StatelessWidget {
  const ExpandToolsButton(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      backgroundColor: Colors.grey.shade900,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
    ;
  }
}
