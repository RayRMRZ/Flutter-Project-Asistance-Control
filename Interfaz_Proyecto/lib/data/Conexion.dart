
import 'dart:async';

import 'package:Interfaz_Proyecto/backend/ControlVentanas.dart';

import 'package:http/http.dart' as http;
///Clase Conexion_http realiza métodos CRUD hacia 
///API.
// ignore: camel_case_types
class Conexion_http {
  int _flag = 0;

  String _respuesta;
///Obtiene el código de estado del ingreso en login,
///[params] recibe correo, contraseña y el control del loginUI
///(email)(password)(control)
///[return] retorna un objeto de tipo Completer con mensaje
///del estado de conexión.
  Future<String> getStatusCode(
      String email, String password, Control control) async {
    Completer completer = Completer<String>();
    try {
      final http.Response resp = await http.post('https://credencia.herokuapp.com/auth/local',
          body: {'identifier': email, 'password': password});
          /* print(resp.body); */
      if (resp.statusCode == 200) {
        _getDatatoCompare();
        _respuesta = resp.body;
        
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
///Asigna a flag=1 si el resp.statusCode==200.
  _getDatatoCompare() async {
    _flag = 1;
  }
///[return] flag.
  int get flag => _flag;
///[return] respuesta. 
  String get respuesta => _respuesta;
}
