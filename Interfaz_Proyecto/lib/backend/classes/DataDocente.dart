import 'package:Interfaz_Proyecto/backend/classes/UsuarioD.dart';
import 'package:http/http.dart' as http;

class DataDocente {
  String _id;
  String _username;
  String _email;
  String _nombre;
  String _area;

  DataDocente(String respuesta) {
    final docenteUser = userFromJsonD(respuesta);
    _id = docenteUser.user.id;
    _username = docenteUser.user.username;
    _email = docenteUser.user.email;
    _nombre =
        '${docenteUser.user.nombre} ${docenteUser.user.apellidoPaterno} ${docenteUser.user.apellidoMaterno}';
    _area = docenteUser.user.docente.area;
  }
   addAssistence(String idenity)async {
    try{
    print(idenity+'Es igual: 5fbc568bb202ba0017799f82');
    http.Response asistence = await http.post('https://credencia.herokuapp.com/asistencias',
    body:
    {"fecha": '${DateTime.now()}',
    "asistencia": 'true',
    "alumno": '$idenity',
    "clase": "5fb4c651dfe83c001727cbfd"}
    );
    if(asistence.statusCode==200){
      print("Asistencia añadida");
    }else{
      print('No se pudo añadir la asistencia');
    }
    }catch(ex){
    print('ErrorExc: $ex');
    }
  }

  String get id => _id;
  String get username => _username;
  String get email => _email;
  String get nombre => _nombre;
  String get area => _area;
}
