import 'dart:convert';
import 'package:notion_editor/content/block-model.dart';
import 'package:notion_editor/content/content-buttons.dart';
import 'package:notion_editor/content/content-editor-toolbar.dart';
import 'package:flutter/widgets.dart';
import 'content-editor-state-model.dart';

typedef SaveContent = void Function(ContentEditorStateModel editorState);

typedef AddBlockCallback = void Function(ContentButtonModel button);
typedef UpdateBlockCallback = void Function(String propName, dynamic value);

class ContentEditor extends StatefulWidget {
  const ContentEditor(
      {Key? key, required this.editorState, required this.saveContent})
      : super(key: key);

  final ContentEditorStateModel editorState;
  final SaveContent saveContent;

  @override
  _ContentEditorState createState() => _ContentEditorState();
}

class _ContentEditorState extends State<ContentEditor> {
  ContentEditorStateModel editorState = ContentEditorStateModel(blocks: []);
  int focusedItem = 0;
  final ScrollController _controller = ScrollController();

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent + 100,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      editorState = widget.editorState;
    });
  }

  @override
  void dispose() {
    widget.saveContent(editorState);
    super.dispose();
  }

  void addBlock(ContentButtonModel button) {
    _scrollDown();
    setState(() {
      if (button.value == BlockTypes.text) {
        editorState.blocks.add(BlockModel(
            blockType: button.value,
            blockProps: {"typography": button.label.replaceAll(" ", "")}));
      } else if (button.value == BlockTypes.image) {
        editorState.blocks
            .add(BlockModel(blockType: button.value, blockProps: {}));
      } else if (button.value == BlockTypes.listItem) {
        editorState.blocks.add(BlockModel(
            blockType: button.value, blockProps: {"typography": "Body"}));
      }
    });
  }

  void deleteBlock() {
    setState(() {
      editorState.blocks.removeAt(focusedItem);
    });
  }

  void updateBlock(int index, String propName, dynamic value) {
    setState(() {
      editorState.blocks[index].blockProps?[propName] = value;
    });
  }

  void onFocus(int index) {
    setState(() {
      focusedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.only(left: 18, right: 18, bottom: 64),
        child: ListView.builder(
            controller: _controller,
            shrinkWrap: true,
            itemCount: editorState.blocks.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: editorState.blocks[index].getBlock(() {
                    onFocus(index);
                  }, (String propName, dynamic value) {
                    updateBlock(index, propName, value);
                  }));
            }),
      ),
      Positioned(
        bottom: 0,
        child: ContentEditorToolbar(
            addBlock: addBlock,
            deleteBlock: deleteBlock,
            saveContent: () {
              widget.saveContent(editorState);
            }),
      )
    ]);
  }
}
