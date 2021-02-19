import 'package:http/http.dart' as http;
import 'package:card/models/cep.model.dart';

class ViaCepService {
  static Future<CepModel> fetchCep({String cep}) async {
    final response = await http.get('https://viacep.com.br/ws/$cep/json/');
    if (response.statusCode == 200) {
      return CepModel.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
