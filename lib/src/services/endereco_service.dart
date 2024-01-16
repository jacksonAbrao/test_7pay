import '../core/rest_client/custom_dio.dart';
import '../models/endereco_model.dart';

class EnderecoService {
  final CustomDio _client;

  EnderecoService(this._client);

  Future<List<EnderecoModel>> getEnderecos(
    String uf,
    String cidade,
    String logradouro,
  ) async {
    try {
      final response = await _client.get(
        '/$uf/$cidade/$logradouro/json',
      );
      return (response.data as List)
          .map(
            (e) => EnderecoModel.fromMap(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
