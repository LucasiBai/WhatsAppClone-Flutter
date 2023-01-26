import 'package:flutter/material.dart';

import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){
                      goBack(context);
                    },
                    icon: const Icon(AppIcons.closeIcon , color: Colors.white,),
                  ),
                ],
              ),
              const Expanded(
                child: Center(
                  child: Text("Camera", style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
