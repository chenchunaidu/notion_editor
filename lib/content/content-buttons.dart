import 'package:notion_editor/content/block-model.dart';
import 'package:notion_editor/content/content-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'content-editor.dart';

class ContentButtonModel {
  final String label;
  final BlockTypes value;
  final Map<String, dynamic>? props;

  ContentButtonModel({required this.label, required this.value, this.props});
}

class ContentButtons extends StatelessWidget {
  const ContentButtons({Key? key, required this.addBlock}) : super(key: key);

  final AddBlockCallback addBlock;

  static var buttons = [
    ContentButtonModel(
      label: "Header 1",
      value: BlockTypes.text,
    ),
    ContentButtonModel(label: "Header 2", value: BlockTypes.text),
    ContentButtonModel(label: "Header 3", value: BlockTypes.text),
    ContentButtonModel(label: "Title", value: BlockTypes.text),
    ContentButtonModel(label: "Body", value: BlockTypes.text),
    ContentButtonModel(label: "SmallText", value: BlockTypes.text),
    ContentButtonModel(label: "Caption", value: BlockTypes.text),
    ContentButtonModel(label: "List item", value: BlockTypes.listItem),
    ContentButtonModel(label: "Image", value: BlockTypes.image),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height / 3;
    final double width = MediaQuery.of(context).size.width;

    return Container(
        height: height,
        width: width,
        color: Colors.white,
        child: GridView.count(
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            childAspectRatio: ((width * 2.5) / height),
            padding: EdgeInsets.all(8),
            crossAxisCount: 2,
            children: buttons
                .map((e) => ContentButton(
                      button: e,
                      addBlock: addBlock,
                    ))
                .toList()));
  }
}
