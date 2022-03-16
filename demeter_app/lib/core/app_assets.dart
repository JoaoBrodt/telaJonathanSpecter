//logos
import 'package:flutter/material.dart';

class AppAssets {
  static final avatar = Image.asset('images/avatar.jpeg');
  static final approved =
      Image.asset('images/reembolsos/aprovado_3x.png', cacheHeight: 30);
  static final repproved = Image.asset(
    'images/reembolsos/reprovado_3x.png',
    cacheHeight: 20,
    height: 20,
    fit: BoxFit.scaleDown,
  );
  static final waiting = Image.asset(
    'images/reembolsos/relogio_3x.png',
    cacheHeight: 20,
    height: 20,
    fit: BoxFit.scaleDown,
  );
}
