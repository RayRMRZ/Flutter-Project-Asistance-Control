// ignore: camel_case_types
import 'package:Interfaz_Proyecto/backend/classes/UsuarioA.dart';

class DataAlumno {
  String _id;
  String _username;
  String _email;
  String _ncontrol;
  int _semestre;
  String _carrera;
  String _especialidad;
  String _nombre;


  DataAlumno(String respuesta) {
    final alumnoUser = userFromJson(respuesta);
    _id = alumnoUser.user.alumno.id;
    _username = alumnoUser.user.username;
    _email = alumnoUser.user.email;
    _nombre =
        '${alumnoUser.user.nombre} ${alumnoUser.user.apellidoPaterno} ${alumnoUser.user.apellidoMaterno}';
    _ncontrol = alumnoUser.user.alumno.noControl;
    _carrera = alumnoUser.user.alumno.carrera;
    _semestre = alumnoUser.user.alumno.semestre;
    _especialidad = alumnoUser.user.alumno.especialidad;
  }

  String get id => _id;
  String get username => _username;
  String get email => _email;
  String get ncontrol => _ncontrol;
  int get semestre => _semestre;
  String get carrera => _carrera;
  String get especialidad => _especialidad;
  String get nombre => _nombre;
}
