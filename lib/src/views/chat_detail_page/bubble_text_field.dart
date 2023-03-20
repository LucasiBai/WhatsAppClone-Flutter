import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/styles.dart';

class BubbleTextField extends StatelessWidget {
  const BubbleTextField({
    Key? key,
    required FocusNode focus,
    required TextEditingController textController,
  })  : _focus = focus,
        _textController = textController,
        super(key: key);

  final FocusNode _focus;
  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextStyle textStyle = TextStyle(color: colorScheme.onBackground);

    return Container(
      padding: AppPaddings.mdHor,
      decoration: BoxDecoration(
          color: colorScheme.background, borderRadius: AppBorderRadius.xlAll),
      child: TextField(
        focusNode: _focus,
        style: textStyle,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(borderSide: BorderSide.none),
            hintText: "Mensaje",
            hintStyle: textStyle,),
        controller: _textController,
      ),
    );
  }
}
