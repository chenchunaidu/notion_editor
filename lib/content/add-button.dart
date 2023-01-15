import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../common/icon-button.dart';

class AddButton extends StatelessWidget {
  const AddButton(
      {Key? key, required this.expanded, required this.expandEditor})
      : super(key: key);

  final bool expanded;
  final void Function() expandEditor;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      backgroundColor: Colors.grey.shade900,
      icon: Icon(
        expanded ? Icons.close : Icons.add,
        color: Colors.white,
      ),
      onPressed: expandEditor,
    );
  }
}
