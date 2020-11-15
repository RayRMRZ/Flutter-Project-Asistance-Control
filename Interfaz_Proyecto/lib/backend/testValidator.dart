import '../data/Conexion.dart';

class Validation{

Conexion_http conexion_http=new Conexion_http();

bool isCorrect(String email){
var pattern= r'^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$';
var regExp=RegExp(pattern);

var _;
if ((regExp.hasMatch(email))) {
  _ = true;
} else {
  _ = false;
}
return _;
}

Future<bool> exists(String password) async {
var cnx = await conexion_http.getStatusCode( password);
print("Estado flag: $cnx");
if(conexion_http.flag==1){
return true;
}else{
  return false;
}
}
}
