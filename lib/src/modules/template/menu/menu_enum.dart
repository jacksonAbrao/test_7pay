import 'package:flutter/material.dart';

enum Menu {
  home(
    '/home',
    Icons.home,
    'Home',
  ),
  endereco(
    '/endereco',
    Icons.map,
    'Endereço',
  );

  final String route;
  final IconData icon;
  final String title;

  const Menu(
    this.route,
    this.icon,
    this.title,
  );
}
