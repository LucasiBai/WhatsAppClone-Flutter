import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';

class MuteDialog extends StatelessWidget {
  const MuteDialog({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          "¿Quieres silenciar los estados de ${name.split(" ")[0]}?"),
      content: Text(
          "Las nuevas actualizaciones de estado de ${name} ya no aparecerán en las actualizaciones recientes."),
      actions: [
        TextButton(onPressed: (){}, child: const Text("Sí")),
        TextButton(onPressed: (){
          goBack(context);
        }, child: const Text("No"))
      ],
    );
  }
}
