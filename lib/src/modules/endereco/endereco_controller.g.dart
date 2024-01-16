// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnderecoController on _EnderecoController, Store {
  late final _$enderecoStatusAtom =
      Atom(name: '_EnderecoController.enderecoStatus', context: context);

  @override
  EnderecoStatus get enderecoStatus {
    _$enderecoStatusAtom.reportRead();
    return super.enderecoStatus;
  }

  @override
  set enderecoStatus(EnderecoStatus value) {
    _$enderecoStatusAtom.reportWrite(value, super.enderecoStatus, () {
      super.enderecoStatus = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_EnderecoController.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$enderecosAtom =
      Atom(name: '_EnderecoController.enderecos', context: context);

  @override
  List<EnderecoModel> get enderecos {
    _$enderecosAtom.reportRead();
    return super.enderecos;
  }

  @override
  set enderecos(List<EnderecoModel> value) {
    _$enderecosAtom.reportWrite(value, super.enderecos, () {
      super.enderecos = value;
    });
  }

  late final _$getEnderecosAsyncAction =
      AsyncAction('_EnderecoController.getEnderecos', context: context);

  @override
  Future<dynamic> getEnderecos(String uf, String cidade, String logradouro) {
    return _$getEnderecosAsyncAction
        .run(() => super.getEnderecos(uf, cidade, logradouro));
  }

  @override
  String toString() {
    return '''
enderecoStatus: ${enderecoStatus},
errorMessage: ${errorMessage},
enderecos: ${enderecos}
    ''';
  }
}
