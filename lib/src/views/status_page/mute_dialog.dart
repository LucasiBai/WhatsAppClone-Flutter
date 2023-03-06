import 'package:flutter/material.dart';

class MuteDialog extends StatelessWidget {
  const MuteDialog({Key? key, required this.name, required this.buttons}) : super(key: key);

  final String name;
  final List<TextButton> buttons;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textStyle = TextStyle(color: theme.colorScheme.onPrimary);

    return AlertDialog(
      backgroundColor: theme.colorScheme.primary,
      title: Text(
          "¿Quieres silenciar los estados de ${name.split(" ")[0]}?", style: textStyle,),
      content: Text(
          "Las nuevas actualizaciones de estado de ${name} ya no aparecerán en las actualizaciones recientes.", style: textStyle,),
      actions: buttons,
    );
  }
}
