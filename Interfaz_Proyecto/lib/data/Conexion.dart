import 'package:Interfaz_Proyecto/backend/classes/Usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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
      final http.Response resp = await http.post(
          'https://credencia.herokuapp.com/auth/local',
          body: {'identifier': email, 'password': password});

      print('Código recibido: ${resp.statusCode}');
      if (resp.statusCode == 200) {
        getDatatoCompare();

        getAll(resp);

        completer.complete('Se ha realizado la petición http\n');
      } else {
        completer.completeError('Ocurrió un error con la petición!');
      }
    } catch (e) {
      completer.completeError('Sin conexión a internet');
    }
    return completer.future;
  }

  getDatatoCompare() async {
    _flag = 1;
  }

  getAll(http.Response response) async {
    final user = userFromJson(response.body);
    print('Esta es la id: ${user.user.perfil}');
  }
}
