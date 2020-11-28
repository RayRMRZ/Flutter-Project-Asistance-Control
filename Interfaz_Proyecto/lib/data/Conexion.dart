import 'package:Interfaz_Proyecto/backend/ControlVentanas.dart';
import 'package:Interfaz_Proyecto/backend/classes/Clase.dart';
import 'package:Interfaz_Proyecto/backend/classes/DataAlumno.dart';
import 'package:Interfaz_Proyecto/backend/classes/DataAlumnoN.dart';
import 'package:Interfaz_Proyecto/backend/classes/Materia.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

// ignore: camel_case_types
class Conexion_http {
  int _flag = 0;

  String _respuesta;

  List<dynamic> _nombres;

  List<dynamic> _horaI;

  List<dynamic> _horaF;

  List<dynamic> _id_Materia;

  Future<String> getStatusCode(
      String email, String password, Control control) async {
    Completer completer = Completer<String>();
    try {
      final http.Response resp = await http.post(
          'https://credencia.herokuapp.com/auth/local',
          body: {'identifier': email, 'password': password});

      if (resp.statusCode == 200) {
        _getDatatoCompare();
        _respuesta = resp.body;
        if(control.pagEst==true){
        _getClases(_respuesta);
        }
        
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

  // ignore: unused_element
  _getClases(String r) async {
    DataAlumno alumnoUs = new DataAlumno(r);
    _id_Materia = ['ID materia:'];
    _nombres = ['Materias:'];
    _horaI = ['Inicial:'];
    _horaF = ['Final:'];

    try {
      http.Response alumno = await http.get('https://credencia.herokuapp.com/alumnos/${alumnoUs.id}');
      /* print('https://credencia.herokuapp.com/alumnos/${alumnoUs.id}'); */

      if (alumno.statusCode == 200) {
        final jsonAlumno = alumnoFromJson(alumno.body);
        print("Número de Clases: ${jsonAlumno.clases.length}");

        for (int i = 0; i < (jsonAlumno.clases.length); i++) {
          try {
            http.Response matter = await http.get(
                'https://credencia.herokuapp.com/materias/${jsonAlumno.clases[i].materia}');
            /* print('https://credencia.herokuapp.com/materias/${jsonAlumno.clases[i].materia}'); */
            if (matter.statusCode == 200) {
              final jsonMateria = materiaFromJson(matter.body);
              /* print(jsonMateria.nombreMateria); */
              _nombres.add(jsonMateria.nombreMateria);
              _id_Materia.add(jsonAlumno.clases[i].materia);
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

        print(nombres);
        print(id_Materia);
        print(horaI);
        print(horaF);
      }
    } catch (ex) {
      print('Excepción: $ex');
    }
  }

  int get flag => _flag;
  String get respuesta => _respuesta;
  List<dynamic> get nombres => _nombres;
  List<dynamic> get horaI => _horaI;
  List<dynamic> get horaF => _horaF;
  List<dynamic> get id_Materia => _id_Materia;
}
