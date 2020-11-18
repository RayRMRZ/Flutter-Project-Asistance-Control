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

  Future<int> exists(String email, String password,String tabla) async {
    conexion_http.getUrl(tabla);
    var cnx = await conexion_http.getStatusCode(email, password);

    print("Status Code: $cnx");
    print('Entró al validador: ${conexion_http.flag}');
   return codeVerification();
  }

  int codeVerification(){
   int code;
    switch(conexion_http.flag){
      case 1: code=1; break;
      case 2: code=2; break;
      case 3: code=3; break;}
    return code;
  }

}
