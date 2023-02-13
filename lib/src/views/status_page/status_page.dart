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

    return Container(
      color: theme.colorScheme.background,
      child: ListView(
        children: [
          MyStatusCard(
            onTap: () {
              goToRoute(context, "/camera");
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPaddings.sm, horizontal: AppPaddings.l),
            child: Text(
              "Recientes",
              style: textColor,
            ),
          ),
          ..._getCards()["notViewed"],
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
            child: Padding(
              padding: AppPaddings.smHor,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(AppIcons.lockIcon, size: AppIcons.mdSize, color: onBackground.withOpacity(0.5),),
                  Text(
                    "Tus actualizaciones de estado están",
                    textAlign: TextAlign.center,
                    style: textColor.copyWith(fontSize: AppTexts.mdSize, fontWeight: AppTexts.mdWeight),
                  ),
                  Text(
                    " cifradas de extremo a extremo.",
                    textAlign: TextAlign.center,
                    style: textColor.copyWith(color: theme.colorScheme.secondary,fontSize: AppTexts.mdSize, fontWeight: AppTexts.mdWeight),
                  ),
                ],
              ),
            )
          )
        ],
      ),
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
