import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/styles.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({Key? key, this.child}) : super(key: key);

  final child;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      decoration:
      BoxDecoration(color: isDarkMode ? colorScheme.primary : Colors.white, boxShadow: const [
        BoxShadow(blurRadius: AppBorderRadius.sm, color: Colors.black26)
      ]),
      padding: AppPaddings.mdVer,
      child: child
    );
  }
}
