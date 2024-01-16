import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance => _instance ??= ColorsApp._();

  Color get primary => const Color(0xffff8f1f);
  Color get primary50 => const Color.fromARGB(125, 255, 143, 50);
  Color get dark => const Color(0xff3d3d3d);
  Color get light => const Color(0xffe5e5e5);
  Color get white => const Color(0xffffffff);
}

extension ColorsAppExceptions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
