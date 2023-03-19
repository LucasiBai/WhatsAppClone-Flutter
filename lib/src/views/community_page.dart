import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/text_big_button.dart';
import 'package:whatsapp_clone/src/styles.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final TextStyle standardTextStyle =
        TextStyle(color: colorScheme.onBackground);

    return ListView(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: 200,
            maxWidth: 300
          ),
          child: Image.asset(
            "assets/images/community.png", fit: BoxFit.contain,),
        ),
        Padding(
          padding: AppPaddings.mdHor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                  text: TextSpan(children: [
                TextSpan(
                    text: "Presentamos la función Comunidades",
                    style:
                        standardTextStyle.copyWith(fontSize: AppTexts.xlSize, fontWeight: AppTexts.mdWeight))
              ])),
              const SizedBox(
                height: AppPaddings.md,
              ),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 350
                ),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                              "Organiza con facilidad tus grupos relacionados y envía avisos. Ahora tus comunidades, como vecindarios y escuelas, pueden tener su propio espacio.",
                          style: standardTextStyle.copyWith(color: colorScheme.onBackground.withOpacity(0.7), fontSize: AppTexts.lSize))
                    ])),
              ),
              const SizedBox(
                height: AppPaddings.md,
              ),
              TextBigButton(onTap: () {}, text: "Iniciar tu comunidad")
            ],
          ),
        )
      ],
    );
  }
}
