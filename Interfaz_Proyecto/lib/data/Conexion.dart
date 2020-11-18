
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

    http.Response response = await http.get('https://credencia.herokuapp.com/alumnos/5fb4b9d4dfe83c001727cbf8');
    try {
      if (response.statusCode == 200) {
        getDatatoCompare(response, email, password);
        print(response.body);
        completer.complete('Se ha realizado la petición http\n');
      } else {
        completer.completeError('Error de servidor');
      }
    } catch (e) {
      completer.completeError('Sin conexión a internet');
    }
    return completer.future;
  }

  getDatatoCompare(http.Response response, String email, String password) {
  _flag=1;
  }

  getUrl(String tabla) {
    print('https://credencia.herokuapp.com/$tabla');
  }
  //https://credencia.herokuapp.com/docentes
  //https://credencia.herokuapp.com/alumnos
}
