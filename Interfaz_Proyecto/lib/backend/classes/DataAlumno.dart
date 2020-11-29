// ignore: camel_case_types
import 'package:Interfaz_Proyecto/backend/classes/UsuarioA.dart';
import 'package:Interfaz_Proyecto/backend/classes/Clase.dart';
import 'package:Interfaz_Proyecto/backend/classes/DataAlumnoN.dart';
import 'package:Interfaz_Proyecto/backend/classes/Materia.dart';

import 'package:http/http.dart' as http;
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
  List<String> _idMateria = ['ID materia:'];
  List<String> _nombres = ['Materias:'];
  List<String> _horaI = ['Inicial:'];
  List<String> _horaF = ['Final:'];
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
    obtenerClases();
  }
  obtenerClases()async{
        try {
      http.Response alumno = await http.get('https://credencia.herokuapp.com/alumnos/${_id}');
      print('https://credencia.herokuapp.com/alumnos/${_id}'); 

      if (alumno.statusCode == 200) {
        final jsonAlumno = alumnoFromJson(alumno.body);
       /*  _clases=[jsonAlumno.]; */
        for (int i = 0; i < (jsonAlumno.clases.length); i++) {
          try {
            http.Response matter = await http.get(
                'https://credencia.herokuapp.com/materias/${jsonAlumno.clases[i].materia}');
            /* print('https://credencia.herokuapp.com/materias/${jsonAlumno.clases[i].materia}'); */
            if (matter.statusCode == 200) {
              final jsonMateria = materiaFromJson(matter.body);
              /* print(jsonMateria.nombreMateria); */
              _nombres.add(jsonMateria.nombreMateria);
              _idMateria.add(jsonAlumno.clases[i].materia);
              try {
                http.Response clase = await http.get(
                    'https://credencia.herokuapp.com/clases/${jsonAlumno.clases[i].claseId}');
                if (clase.statusCode == 200) {
                  final jsonClase = claseFromJson(clase.body);
                 /*  print('Hora inicial: ' +jsonClase.horaFinal + ' Hora final: ' + jsonClase.horaInicial); */
                  _horaI.add(jsonClase.horaInicial);
                  _horaF.add(jsonClase.horaFinal);
                } else {
                  print('No se recibió nada de get Clase');
                }
              } catch (ex) {
                print("Excepción $ex");
              }
            } else {
              print('No se recibío ningun dato de get Materia----------------');
            }
          } catch (ex) {
            print('Excepción materia: $ex');
          }
        }

        print(_nombres);
        print(_idMateria);
        print(_horaI);
        print(_horaF);
        
      }
    } catch (ex) {
      print('Excepción: $ex');
    }
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
  ///[return] nombres de clases.
  List<String> get nombres => _nombres;
///[return] hora inicial.
  List<dynamic> get horaI => _horaI;
///[return] hora final.
  List<dynamic> get horaF => _horaF;
///[return] identificador de materia.
  List<dynamic> get idMateria => _idMateria;
}
