import 'package:notion_editor/common/typography/index.dart';
import 'package:notion_editor/content/custom-editable-text-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'content-editor.dart';

class CustomEditableText extends StatefulWidget {
  const CustomEditableText(
      {Key? key, this.props, required this.onFocus, required this.onUpdate})
      : super(key: key);

  final CustomEditableTextModel? props;
  final void Function() onFocus;
  final UpdateBlockCallback onUpdate;

  @override
  _CustomEditableTextState createState() => _CustomEditableTextState();
}

class _CustomEditableTextState extends State<CustomEditableText> {
  TextEditingController editableTextController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    editableTextController.text = widget.props?.text ?? "";
    _focusNode.addListener(() {
      widget.onFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: EditableText(
            onChanged: (value) {
              widget.onUpdate("text", value);
            },
            focusNode: _focusNode,
            controller: editableTextController,
            backgroundCursorColor: Colors.black,
            cursorColor: Colors.black,
            style: typographyStyles[widget.props?.typography]
                    ?.copyWith(color: Colors.black, fontFamily: 'Inter') ??
                TextStyle(),
            autofocus: true,
            onTapOutside: (PointerDownEvent event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            maxLines: null));
  }
}
