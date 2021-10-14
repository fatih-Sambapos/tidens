import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class DividerDecorations {
  static DividerDecorations? _instance;
  static DividerDecorations get instance {
    _instance ??= DividerDecorations();
    return _instance!;
  }

  Divider defaultDivider(BuildContext context) {
    return Divider(height: context.height * .4);
  }
}
