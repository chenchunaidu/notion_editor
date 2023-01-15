import 'package:notion_editor/common/icon-button.dart';
import 'package:notion_editor/common/image-upload.dart';
import 'package:notion_editor/content/block-model.dart';
import 'package:notion_editor/content/content-buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'add-button.dart';
import 'content-editor.dart';
import 'expand-tools-button.dart';

class ContentEditorToolbar extends StatefulWidget {
  const ContentEditorToolbar(
      {Key? key,
      required this.addBlock,
      required this.deleteBlock,
      required this.saveContent})
      : super(key: key);

  final AddBlockCallback addBlock;
  final void Function() deleteBlock;
  final void Function() saveContent;

  @override
  _ContentEditorToolbarState createState() => _ContentEditorToolbarState();
}

class _ContentEditorToolbarState extends State<ContentEditorToolbar> {
  var addToolBar = false;
  var swapToolBar = false;

  void expandAddToolBar() {
    setState(() {
      addToolBar = !addToolBar;
    });
  }

  void expandSwapToolBar() {
    setState(() {
      swapToolBar = !swapToolBar;
    });
  }

  void addBlock(ContentButtonModel button) {
    setState(() {
      addToolBar = false;
    });
    widget.addBlock(button);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          width: MediaQuery.of(context).size.width - 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
          ),
          height: 48,
          child: Row(
            children: [
              ExpandToolsButton(
                icon: addToolBar ? Icons.close : Icons.add,
                onPressed: expandAddToolBar,
              ),
              const SizedBox(
                width: 10,
              ),
              ExpandToolsButton(
                icon: swapToolBar ? Icons.close : Icons.repeat,
                onPressed: expandSwapToolBar,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomIconButton(
                backgroundColor: Colors.grey.shade900,
                icon: const Icon(
                  Icons.perm_media,
                  color: Colors.white,
                ),
                onPressed: () {
                  addBlock(
                      ContentButtonModel(label: "", value: BlockTypes.image));
                },
              ),
              const SizedBox(
                width: 10,
              ),
              CustomIconButton(
                  onPressed: widget.deleteBlock,
                  backgroundColor: Colors.grey.shade900,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              const SizedBox(
                width: 10,
              ),
              CustomIconButton(
                  onPressed: () {
                    widget.saveContent();
                  },
                  backgroundColor: Colors.grey.shade900,
                  icon: const Icon(
                    Icons.save,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        (addToolBar || swapToolBar)
            ? ContentButtons(addBlock: addBlock)
            : Container()
      ]),
    );
  }
}
