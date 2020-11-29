
import 'dart:async';

import 'package:Interfaz_Proyecto/backend/ControlVentanas.dart';
import 'package:Interfaz_Proyecto/backend/classes/Clase.dart';
import 'package:Interfaz_Proyecto/backend/classes/DataAlumno.dart';
import 'package:Interfaz_Proyecto/backend/classes/DataAlumnoN.dart';

import 'package:Interfaz_Proyecto/backend/classes/DataDocenteN.dart';
import 'package:Interfaz_Proyecto/backend/classes/Materia.dart';
import 'package:Interfaz_Proyecto/backend/classes/UsuarioD.dart';

import 'package:http/http.dart' as http;

///Clase Conexion_http realiza métodos CRUD hacia 
///API.
// ignore: camel_case_types
class Conexion_http {
  int _flag = 0;

  String _respuesta;

  List<dynamic> _idMateria;
  List<dynamic> _nombres;
  List<dynamic> _horaI;
  List<dynamic> _horaF;
  List <dynamic> _clases;
///Obtiene el código de estado del ingreso en login,
///[params] recibe correo, contraseña y el control del loginUI
///(email)(password)(control)
///[return] retorna un objeto de tipo Completer con mensaje
///del estado de conexión.
  Future<String> getStatusCode(
      String email, String password, Control control) async {
    Completer completer = Completer<String>();
    try {
      final http.Response resp = await http.post('https://credencia.herokuapp.com/auth/local',
          body: {'identifier': email, 'password': password});

      if (resp.statusCode == 200) {
        _getDatatoCompare();
        _respuesta = resp.body;
        if(control.pagEst==true){
        _getClases(_respuesta);
        }else{_getClasesD(respuesta);}
        
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
///Asigna a flag=1 si el resp.statusCode==200.
  _getDatatoCompare() async {
    _flag = 1;
  }
///Obtiene clases del Alumno y se asignan a _clases,
///[param] recibe resp.body (respuesta).
  _getClases(String respuesta) async {
    DataAlumno alumnoUs = new DataAlumno(respuesta);
    _idMateria = ['ID materia:'];
    _nombres = ['Materias:'];
    _horaI = ['Inicial:'];
    _horaF = ['Final:'];

    try {
      http.Response alumno = await http.get('https://credencia.herokuapp.com/alumnos/${alumnoUs.id}');
      /* print('https://credencia.herokuapp.com/alumnos/${alumnoUs.id}'); */

      if (alumno.statusCode == 200) {
        final jsonAlumno = alumnoFromJson(alumno.body);
        _clases=[jsonAlumno.clases.length];
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

        _clases.add(_nombres);_clases.add(_idMateria);_clases.add(_horaI);_clases.add(_horaF);
        
      }
    } catch (ex) {
      print('Excepción: $ex');
    }
  }

  _getClasesD(String respuesta)async {
    final docenteUser=userFromJsonD(respuesta);
    _idMateria = ['ID docente:'];
    _nombres = ['Materias:'];
    _horaI = ['Inicial:'];
    _horaF = ['Final:'];
    try{
      http.Response docente=await http.get('https://credencia.herokuapp.com/docentes/${docenteUser.user.docente.id}');
      print('https://credencia.herokuapp.com/docentes/${docenteUser.user.docente.id}');
      if(docente.statusCode==200){
        final jsonDocente=docenteFromJson(docente.body);
        for(int i=0;i<jsonDocente.clases.length;i++){
          try{
            http.Response matter= await http.get('https://credencia.herokuapp.com/materias/${jsonDocente.clases[i].materia}');
            if(matter.statusCode==200){
              final jsonMateria=materiaFromJson(matter.body);
              _nombres.add(jsonMateria.nombreMateria);
              _idMateria.add(jsonMateria.id);
            try{
              http.Response clase= await http.get('https://credencia.herokuapp.com/clases/${jsonDocente.clases[i].claseId}');
               if(clase.statusCode==200){
                 final jsonClase=claseFromJson(clase.body);

                 _horaI.add(jsonClase.horaInicial);
                  _horaF.add(jsonClase.horaFinal);
               }else{
                 print('No se recibió nada de get Clase');
               }
            }catch(ex){
              print("Excepción $ex");
            }
            }else{
              print('No se recibío ningun dato de get Materia----------------');
            }
          }catch(ex){
            print("Excepción $ex");
          }
        }

      }else{
        print('No se recibío ningun dato de get Materia----------------');
      }

    }catch(ex){
      print('Excepción: $ex');
    }
        print(_nombres);
        print(_idMateria);
        print(_horaI);
        print(_horaF);

  }
///[return] flag.
  int get flag => _flag;
///[return] respuesta. 
  String get respuesta => _respuesta;
///[return] nombres de clases.
  List<dynamic> get nombres => _nombres;
///[return] hora inicial.
  List<dynamic> get horaI => _horaI;
///[return] hora final.
  List<dynamic> get horaF => _horaF;
///[return] identificador de materia.
  List<dynamic> get idMateria => _idMateria;
///[return] Lista dinamica que contiene datos
///relacionados con las clases del usuario.
  List <dynamic> get clases => _clases;
}
