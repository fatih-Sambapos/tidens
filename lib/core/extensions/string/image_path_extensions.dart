import 'package:flutter/material.dart';

extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
  String get toIconSVG => 'assets/svg/icons/$this.svg';

  Image get pngImageAsset => Image.asset('assets/png/$this.png');
  Image get pngLogoAsset => Image.asset('assets/images/logo/$this.png');
  Image get pngIconAsset => Image.asset('assets/icons/$this.png');
}
