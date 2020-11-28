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
  int get flag => _flag;
  String _respuesta;
  String get respuesta => _respuesta;

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
        _getClases(_respuesta);
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

    try {
      http.Response alumno = await http.get('https://credencia.herokuapp.com/alumnos/${alumnoUs.id}');print('https://credencia.herokuapp.com/alumnos/${alumnoUs.id}');
      if (alumno.statusCode == 200) {
        final jsonAlumno = alumnoFromJson(alumno.body);
        print(jsonAlumno.clases.length); 
        
        try{
          http.Response matter = await http.get('https://credencia.herokuapp.com/materias/${jsonAlumno.clases[0].materia}');
          print('https://credencia.herokuapp.com/materias/${jsonAlumno.clases[0].materia}');
          if(matter.statusCode==200){
            final jsonMateria = materiaFromJson(matter.body);
            print(jsonMateria.nombreMateria);
            
          }
        }catch(ex){
          print('Excepción materia: $ex');
        }

        try {
          http.Response clase = await http.get('https://credencia.herokuapp.com/clases/${jsonAlumno.clases[0].claseId}');
          
          print(clase.body);

          if (clase.statusCode == 200) {
            final jsonClase = claseFromJson(clase.body);
            print('Hora final: '+jsonClase.horaFinal+' Hora inicial: '+jsonClase.horaInicial);
          } else {
            print('ocurrió un error');
          }
        } catch (ex) {
          print("Excepción $ex");
        }
      }
    } catch (ex) {
      print('Excepción: $ex');
    }
  }
}
