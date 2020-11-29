// ignore: camel_case_types
import 'package:Interfaz_Proyecto/backend/classes/UsuarioA.dart';
///Clase DataAlumno contiene los atributos del usuario tipo Alumno.
class DataAlumno {
  String _id;
  String _username;
  String _email;
  String _ncontrol;
  int _semestre;
  String _carrera;
  String _especialidad;
  String _nombre;

///Contructor de la clase DataAlumno, [param] response.body (respuesta).
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
///[return] identificador de alumno.
  String get id => _id;
///[return] nombre de usuario.
  String get username => _username;
///[return] correo de alumno.
  String get email => _email;
///[return] número de control de alumno.
  String get ncontrol => _ncontrol;
/// [return] semestre de alumno.
  int get semestre => _semestre;
/// [return] carrera de alumno.
  String get carrera => _carrera;
/// [return] especialidad de alumno.
  String get especialidad => _especialidad;
/// [return] nombre del alumno.
  String get nombre => _nombre;
}
