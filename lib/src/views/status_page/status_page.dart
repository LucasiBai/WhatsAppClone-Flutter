import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';

import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/views/status_page/my_status_card.dart';
import 'package:whatsapp_clone/src/views/status_page/status_card.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List _feedList = [];

  @override
  void initState() {
    getFeed();
    super.initState();
  }

  getFeed() async {
    final data = await getStatusList();
    setState(() {
      _feedList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color onBackground = theme.colorScheme.onBackground;

    TextStyle textColor = TextStyle(
        color: onBackground.withOpacity(0.5),
        fontWeight: AppTexts.mdWeight,
        fontSize: AppTexts.mdSize);

    return ListView(
      children: [
        MyStatusCard(
          onTap: () {
            goToRoute(context, "/camera");
          },
        ),
        if (_getCards()["notViewed"].length == 0 &&
            _getCards()["viewed"].length == 0)
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppPaddings.l, AppPaddings.sm, AppPaddings.l, AppPaddings.xl),
            child: Text(
              "No hay estados recientes.",
              style: textColor,
            ),
          ),
        if (_getCards()["notViewed"].length > 0)
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPaddings.sm, horizontal: AppPaddings.l),
            child: Text(
              "Recientes",
              style: textColor,
            ),
          ),
        ..._getCards()["notViewed"],
        if (_getCards()["viewed"].length > 0)
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPaddings.sm, horizontal: AppPaddings.l),
            child: Text(
              "Vistos",
              style: textColor,
            ),
          ),
        ..._getCards()["viewed"],
        Divider(
          color: onBackground.withOpacity(0.2),
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, AppPaddings.sm, 0),
                child: Icon(
                  AppIcons.lockIcon,
                  size: AppIcons.mdSize,
                  color: onBackground.withOpacity(0.5),
                ),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: textColor.copyWith(
                          fontSize: AppTexts.mdSize,
                          fontWeight: AppTexts.mdWeight),
                      children: [
                        const TextSpan(
                            text: "Tus actualizaciones de estado están "),
                        TextSpan(
                          text: "cifradas de extremo a extremo.",
                          style: textColor.copyWith(
                              color: theme.colorScheme.secondary,
                              fontSize: AppTexts.mdSize,
                              fontWeight: AppTexts.mdWeight),
                        )
                      ])),
            ],
          ),
        )
      ],
    );
  }

  Map _getCards() {
    List<Widget> statusCardsViewed = [];
    List<Widget> statusCardsNotViewed = [];

    for (final status in _feedList) {
      final widget = StatusCard(
        statusData: status,
      );
      status["viewed"]
          ? statusCardsViewed.add(widget)
          : statusCardsNotViewed.add(widget);
    }

    return {"notViewed": statusCardsViewed, "viewed": statusCardsNotViewed};
  }
}
