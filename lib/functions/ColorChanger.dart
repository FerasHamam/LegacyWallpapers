import 'package:flutter/material.dart';

List<Color> setColor(String name) {
  switch (name) {
    case 'Samsung':
      return [
        Color(0xFF0c4da2),
        Colors.indigoAccent,
      ];
    case 'Xiaomi':
      return [
        Color(0xFFFF6700),
        Colors.cyan,
      ];
    case 'Nokia':
      return [
        Color(0xFF183693),
        Colors.blueGrey,
      ];
    case 'OnePlus':
      return [
        Color(0xFFeb0029),
        Colors.blueGrey,
      ];
    case 'Oppo':
      return [
        Color(0xFF1ea366),
        Colors.white,
      ];
    case 'Realme':
      return [
        Color(0xFFFFC916),
        Colors.redAccent,
      ];
    default:
      return [
        Color(0xFFFF6700),
        Colors.cyan,
      ];
  }
}
