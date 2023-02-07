import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/camera_service.dart';

import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late List<CameraDescription> _cameras;
  late int _currentCamera;

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void initCamera() async {
    final cameras = await useSetCameras();

    setState(() {
      _cameras = cameras;
      _currentCamera = 0;
    });

    _controller = CameraController(
      _cameras[_currentCamera],
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  void updateController() {
    setState(() {
      _controller = CameraController(
        _cameras[_currentCamera],
        ResolutionPreset.medium,
      );

      _initializeControllerFuture = _controller.initialize();
    });
  }

  void switchCamera() {
    setState(() {
      _currentCamera = _currentCamera == 0 ? 1 : 0;
    });

    updateController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Stack(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        goBack(context);
                      },
                      icon: const Icon(
                        AppIcons.closeIcon,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          AppIcons.flashIcon,
                          color: Colors.white,
                        )),
                  ],
                ),
                FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_controller);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: AppPaddings.l, horizontal: AppPaddings.md),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            AppIcons.galleryIcon,
                            color: Colors.white,
                            size: AppIcons.lSize,
                          )),
                      IconButton(
                          onPressed: () async {

                            try {

                              await _initializeControllerFuture;
                              final image = await _controller.takePicture();

                              if (!mounted) return;

                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    body: Center(
                                      child: Image.asset(
                                        image.path,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          },
                          icon: const Icon(
                            AppIcons.captImageCameraIcon,
                            color: Colors.white,
                            size: AppIcons.xlSize,
                          )),
                      IconButton(
                        onPressed: () {
                          switchCamera();
                        },
                        icon: const Icon(
                          AppIcons.switchCameraIcon,
                          color: Colors.white,
                          size: AppIcons.lSize,
                        ),
                      ),
                    ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
