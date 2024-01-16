import 'package:mobx/mobx.dart';

import '../../models/endereco_model.dart';
import '../../services/endereco_service.dart';
part 'endereco_controller.g.dart';

enum EnderecoStatus { empty, loading, error, success }

class EnderecoController = _EnderecoController with _$EnderecoController;

abstract class _EnderecoController with Store {
  _EnderecoController(this._enderecoService);
  final EnderecoService _enderecoService;

  @observable
  var enderecoStatus = EnderecoStatus.empty;

  @observable
  String? errorMessage;

  @observable
  List<EnderecoModel> enderecos = [];

  @action
  Future getEnderecos(
    String uf,
    String cidade,
    String logradouro,
  ) async {
    try {
      enderecoStatus = EnderecoStatus.loading;
      final end = await _enderecoService.getEnderecos(
        uf,
        cidade,
        logradouro,
      );
      enderecos = end;
      enderecoStatus = EnderecoStatus.success;
    } catch (e) {
      errorMessage =
          'Erro ao buscar endereços, verifique os dados e tente novamente';
      enderecoStatus = EnderecoStatus.error;
      rethrow;
    }
  }
}
