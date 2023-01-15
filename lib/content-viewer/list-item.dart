import 'package:notion_editor/common/typography/index.dart';
import 'package:flutter/widgets.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, this.text}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTypography("\u2022 "),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: CustomTypography(text ?? ""))
      ],
    );
  }
}
