import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class StatusViewCard extends StatelessWidget {
  StatusViewCard(
      {Key? key,
      required this.contactData,
      required this.stories,
      required this.controller})
      : super(key: key);

  final contactData;
  final List<StoryItem> stories;
  final StoryController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StoryView(
        storyItems: stories,
        controller: controller,
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          goBack(context);
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        inline: true,
      ),
      _getViewBar(context)
      ]
    );
  }

  Widget _getViewBar(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: AppPaddings.mdVer,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        goBack(context);
                      },
                      icon: const Icon(
                        AppIcons.backIcon,
                        color: Colors.white,
                      )),
                  GestureDetector(
                    onTap: (){
                      goToRoute(context, "/contactImage/${contactData["id"]}");
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: AppBorderRadius.xlAll,
                            color: Colors.white),
                        padding: const EdgeInsets.all(1),
                        margin: const EdgeInsets.fromLTRB(0, 0, AppPaddings.md, 0),
                        child: ContactImage(
                          hasIcon: false,
                            onTap: () {
                            print("Hola");
                            },
                            size: AppSizes.smSize,
                            imageUrl: contactData["image"])),
                  ),
                  Text(
                    contactData["name"],
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    AppIcons.optionsIcon,
                    color: Colors.white,
                  ))
            ],
          ),
        ));
  }
}
