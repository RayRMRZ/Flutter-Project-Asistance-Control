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
        await http.get('https://credencia.herokuapp.com/docentes/5fb4b842dfe83c001727cbf2');
        
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

  getDatatoCompare(var response, String email, String password) async {
    
    Map<String, String> datos = {'email': email, 'area': password};

    final jsonData = jsonDecode(response.body);

    if ((jsonData['email'] == datos['email']) &&
        jsonData['area'] == datos['area']) {
      _flag = 1;
      print("Mapa1: ${jsonData['email']} es igual a Mapa 2: ${datos['email']}");
      print(
          "Mapa1: ${jsonData['area']} es igual a Mapa 2: ${datos['area']}");
    } else {
      print(
          "Mapa1: ${jsonData['email']} no es igual a Mapa 2: ${datos['email']}");
      print(
          "Mapa1: ${jsonData['area']} no es igual a Mapa 2: ${datos['area']}");
    }
  }
}
