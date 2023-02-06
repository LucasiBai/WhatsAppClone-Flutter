import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


Future<List<CameraDescription>> useSetCameras()async{
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  return [cameras.first, cameras.last];
}