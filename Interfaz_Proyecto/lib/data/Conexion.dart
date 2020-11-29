import 'package:Interfaz_Proyecto/Dialogs.dart';
import 'package:Interfaz_Proyecto/backend/ControlVentanas.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// ignore: camel_case_types
class Conexion_http {

  int _flag = 0;
  int get flag => _flag;
  String _respuesta;
  String get respuesta => _respuesta;

  Future<String> getStatusCode(
      String email, String password, Control control) async {
    Completer completer = Completer<String>();
    try {
      final http.Response resp = await http.post(
          'https://credencia.herokuapp.com/auth/local',
          body: {'identifier': email, 'password': password});

      if (resp.statusCode == 200) {
        _getDatatoCompare();
        _respuesta=resp.body;
        completer.complete('Se ha realizado la petición http\n');
      } else {
        
        completer.completeError(
            'Ocurrió un error con la petición! ${resp.statusCode}');
      }
    } catch (e) {
      completer.completeError('Sin conexión a internet');
    }
    return completer.future;
  }

  _getDatatoCompare() async {
    _flag = 1;
  }
}
