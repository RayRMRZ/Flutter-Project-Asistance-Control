import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// ignore: camel_case_types
class Conexion_http {
  int _flag = 0;

  // ignore: unnecessary_getters_setters
  int get flag => _flag;

  // ignore: unnecessary_getters_setters
  set flag(int flag) {
    _flag = flag;
  }

  Future<String> getStatusCode(String email, String password) async {
    Completer completer = Completer<String>();

    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/users/1');
    try {
      if (response.statusCode == 200) {
        getDatatoCompare(response, email, password);

        completer.complete('Se ha realizado la petición http\n');
      } else {
        completer.completeError('Error de servidor');
      }
    } catch (e) {
      completer.completeError('Sin conexión a internet');
    }
    return completer.future;
  }

  getDatatoCompare(var response, String email, String password) async {
    Map<String, String> datos = {'email': email, 'username': password};

    final jsonData = jsonDecode(response.body);

    if ((jsonData['email'] == datos['email']) &&
        jsonData['username'] == datos['username']) {
      _flag = 1;
      print("Mapa1: ${jsonData['email']} es igual a Mapa 2: ${datos['email']}");
      print(
          "Mapa1: ${jsonData['username']} es igual a Mapa 2: ${datos['username']}");
    } else {
      print(
          "Mapa1: ${jsonData['email']} no es igual a Mapa 2: ${datos['email']}");
      print(
          "Mapa1: ${jsonData['username']} no es igual a Mapa 2: ${datos['username']}");
    }
  }
}
