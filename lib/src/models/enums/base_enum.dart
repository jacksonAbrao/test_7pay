import 'package:flutter/material.dart';

abstract class BaseEnum {
  Map<String, String> enumeradores;
  String? defaultOption;
  BaseEnum({
    required this.enumeradores,
    this.defaultOption,
  });

  bool existeEnum(String tipo) {
    return enumeradores.containsKey(tipo);
  }

  String getString(String opcao) {
    return enumeradores[opcao] ?? defaultOption ?? 'Opção não encontrada';
  }

  Map<String, String> getAllEnum() {
    return enumeradores;
  }

  List<DropdownMenuItem<String>> dropDowns() {
    final List<DropdownMenuItem<String>> aux = [];
    for (var en in enumeradores.keys) {
      aux.add(
        DropdownMenuItem<String>(
          value: en,
          child: Text(enumeradores[en]!),
        ),
      );
    }
    return aux;
  }
}
