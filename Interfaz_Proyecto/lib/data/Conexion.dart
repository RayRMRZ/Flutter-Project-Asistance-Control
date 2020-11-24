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
    try {
      final http.Response response = await http.post('https://credencia.herokuapp.com/auth/local', 
      body: {
        'identifier': email,
        'password': password
      // ignore: missing_return
      }).then((response) {
        print('Código recibido: ${response.statusCode}');
        if (response.statusCode == 200) {
          getDatatoCompare(response);
          completer.complete('Se ha realizado la petición http\n');
        } else {
            completer.completeError('Ocurrió un error con la petición!');
        }
      });
    } catch (e) {
      completer.completeError('Sin conexión a internet');
    }
    return completer.future;
  }

  getDatatoCompare(var response) async {
    _flag = 1;
  }
}
