import 'package:Interfaz_Proyecto/backend/ControlVentanas.dart';
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
  bool formatString(String texto){
    var pattern=r'^[^0-9]\w+(\s)*?(.)*$';
    var reExp=RegExp(pattern);
    
  if(reExp.hasMatch(texto)){
    return true;
  }else{
    return false;
  }
  }
  bool formatNcontrol(String numero){
  var pattern=r'^[0-9]{8}$';
    var reExp=RegExp(pattern);
    
  if(reExp.hasMatch(numero)){
    return true;
  }else{
    return false;
  }
  }
  bool formatNSem(String numero){
    var pattern=r'^(1|2|3|4|5|6|7|8|9|10|11|12|13)$';
    var reExp=RegExp(pattern);
    
  if(reExp.hasMatch(numero)){
    return true;
  }else{
    return false;
  }
  }

  Future<bool> exists(String email, String password, Control control) async {
    var cnx = await conexion_http.getStatusCode(email, password, control);
    print("Status Code: $cnx");
    print('Entró al validador: ${conexion_http.flag}');
    return codeVerification();
  }

  bool codeVerification() {
    if (conexion_http.flag == 1) {
      return true;
    } else {
      return false;
    }
  }
  String sendResponse(){
    //print('Ets: ${conexion_http.respuesta} ');
    return conexion_http.respuesta;
  }
}
