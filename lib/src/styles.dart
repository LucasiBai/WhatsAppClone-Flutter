import 'package:flutter/material.dart';

class AppIcons {
  //Icons
  static const IconData checkIcon = Icons.check;
  static const IconData backIcon = Icons.arrow_back;
  static const IconData closeIcon = Icons.close;
  static const IconData cameraIcon = Icons.camera_alt_outlined;
  static const IconData searchIcon = Icons.search;
  static const IconData optionsIcon = Icons.more_vert;
  static const IconData faceTimeIcon = Icons.videocam;
  static const IconData phoneIcon = Icons.phone;

  //Sizes
  static const double smSize = 10;
  static const double mdSize = 15;
  static const double lSize = 20;
  static const double xlSize = 25;
  static const double xxlSize = 35;

}

class AppTexts{
  //weights
  static const FontWeight smWeight = FontWeight.w300;
  static const FontWeight mdWeight = FontWeight.w500;
  static const FontWeight xlWeight = FontWeight.w800;

  //Sizes
  static const double smSize = 10;
  static const double mdSize = 15;
  static const double lSize = 20;
  static const double xlSize = 30;
  static const double xxlSize = 35;
}

class AppSizes{
  static const double smSize = 15;
  static const double mdSize = 25;
  static const double lSize = 35;
  static const double xlSize = 45;
  static const double xxlSize = 50;
}

class AppContraints {
  static const double smSize = 100;
  static const double mdSize = 200;
  static const double lSize = 300;
  static const double xlSize = 400;
}

class AppPaddings{
  // Values
  static const double sm = 5;
  static const double md = 10;
  static const double l = 15;
  static const double xl = 20;

  // All
  static const EdgeInsets smAll = EdgeInsets.all(sm);
  static const EdgeInsets mdAll = EdgeInsets.all(md);
  static const EdgeInsets lAll = EdgeInsets.all(l);
  static const EdgeInsets xlAll = EdgeInsets.all(xl);

  // Horizontal
  static const EdgeInsets smHor = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets mdHor = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets lHor = EdgeInsets.symmetric(horizontal: l);
  static const EdgeInsets xlHor = EdgeInsets.symmetric(horizontal: xl);


  // Vertical
  static const EdgeInsets smVer = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets mdVer = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets lVer = EdgeInsets.symmetric(vertical: l);
  static const EdgeInsets xlVer = EdgeInsets.symmetric(vertical: xl);

  //Left
  static const EdgeInsets smLeft = EdgeInsets.fromLTRB(sm, 0, 0, 0);
  static const EdgeInsets mdLeft = EdgeInsets.fromLTRB(md, 0, 0, 0);
  static const EdgeInsets lLeft = EdgeInsets.fromLTRB(l, 0, 0, 0);
  static const EdgeInsets xlLeft = EdgeInsets.fromLTRB(xl, 0, 0, 0);
}

class AppBorderRadius{
  static const double sm = 5;
  static const double md = 10;
  static const double l = 15;
  static const double xl = 20;

  static BorderRadius smAll = BorderRadius.circular(sm);
  static BorderRadius mdAll = BorderRadius.circular(md);
  static BorderRadius lAll = BorderRadius.circular(l);
  static BorderRadius xlAll = BorderRadius.circular(xl);
}