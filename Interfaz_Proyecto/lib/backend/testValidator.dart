import 'package:Interfaz_Proyecto/data/Conexion.dart';

class Validation {
// ignore: non_constant_identifier_names
  Conexion_http conexion_http = new Conexion_http();

  bool isCorrect(String email) {
    var pattern =
        r'^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[a-z]{2,3})$';
    var regExp = RegExp(pattern);

    var _;
    if ((regExp.hasMatch(email))) {
      _ = true;
    } else {
      _ = false;
    }
    return _;
  }

  Future<bool> exists(String email, String password) async {
    var cnx = await conexion_http.getStatusCode(email, password);
    print("Status Code: $cnx");
    print('Entró al validador: ${conexion_http.flag}');
    if (conexion_http.flag == 1) {
      return true;
    } else {
      return false;
    }
  }
}
