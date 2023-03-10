import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/text_big_button.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: const TextSpan(children: [
              TextSpan(text: "Presentamos la función Comunidades")
            ])),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text:
                      "Organiza con facilidad tus grupos relacionados y envía avisos. Ahora tus comunidades, como vecindarios y escuelas, pueden tener su propio espacio.")
            ])),
          TextBigButton(onTap: (){}, child: const Text("Iniciar tu comunidad"))
          ],
        )
      ],
    );
  }
}
