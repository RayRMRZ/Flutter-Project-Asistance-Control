import 'package:Interfaz_Proyecto/Dialogs.dart';
import 'package:Interfaz_Proyecto/FlushBar_Snack.dart';
import 'package:Interfaz_Proyecto/backend/classes/Clase.dart';
import 'package:Interfaz_Proyecto/backend/classes/DataDocenteN.dart';
import 'package:Interfaz_Proyecto/backend/classes/Materia.dart';
import 'package:Interfaz_Proyecto/backend/classes/UsuarioD.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
///Clase DataDocente contiene los atributos del usuario tipo Docente.
class DataDocente {
  String _id;
  String _idDocente;
  String _username;
  String _email;
  String _nombre;
  String _area;
  List<String> _nombresMateria = [];
  List<String>_idMateria = [];
  List<String>_horaI = ['Inicial:'];
  List<String> _horaF = ['Final:'];
  String response;
///Contructor de la clase DataDocente, [param] response.body (respuesta).
  DataDocente(String respuesta) {
    response=respuesta;
    final docenteUser = userFromJsonD(respuesta);
    _id = docenteUser.user.id;
    _idDocente=docenteUser.user.docente.id;
    _username = docenteUser.user.username;
    _email = docenteUser.user.email;
    _nombre =
        '${docenteUser.user.nombre} ${docenteUser.user.apellidoPaterno} ${docenteUser.user.apellidoMaterno}';
    _area = docenteUser.user.docente.area;
    obtenerClases();
  }
  ///Método para añadir asistencia por método CRUD hacia API tabla asistencias,
  ///[param] recibe id del método qr_code (idenity).
   addAssistence(String idenity, String materia,BuildContext context)async {
    
    if(_nombresMateria.contains(materia)){
      /* print(_nombresMateria.indexWhere((matter) => matter == materia)); */
          try{/* print('Seleccionó: $materia'); */
    
    http.Response asistence = await http.post('https://credencia.herokuapp.com/asistencias',
    body:
    {"fecha": '${DateTime.now()}',
    "asistencia": 'true',
    "alumno": '$idenity',
    "clase": '${_idMateria[_nombresMateria.indexWhere((matter) => matter == materia)]}'}
    );
    if(asistence.statusCode==200){
    FlushBar_Snack.notifSelected(context, 'Asistencia añadida');
    }else{
      print('No se pudo añadir la asistencia');
    }
    }catch(ex){
    print('ErrorExc: $ex');
    }
    }else{
      FlushBar_Snack.errorQrMsg(context, 'Asistencia no añadida');
      print("Asistencia no añadida");
    }
  }
  obtenerClases()async{
    try{
      http.Response docente=await http.get('https://credencia.herokuapp.com/docentes/${_idDocente}');
      print('https://credencia.herokuapp.com/docentes/${_idDocente}');
      if(docente.statusCode==200){
        final jsonDocente=docenteFromJson(docente.body);
        for(int i=0;i<jsonDocente.clases.length;i++){
          try{
            http.Response matter= await http.get('https://credencia.herokuapp.com/materias/${jsonDocente.clases[i].materia}');
            if(matter.statusCode==200){
              final jsonMateria=materiaFromJson(matter.body);
              _nombresMateria.add(jsonMateria.nombreMateria);
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
        print(_nombresMateria);
        print(_idMateria);
        print(_horaI);
        print(_horaF);
  }
///[return] identificador de docente.
  String get id => _id;
///[return] nombre de usuario.
  String get username => _username;
///[return] correo de docente.
  String get email => _email;
///[return] nombre de docente.
  String get nombre => _nombre;
///[return] area de docente.
  String get area => _area;
  ///[return] nombres de clases.
  List<String> get nombresMateria => _nombresMateria;
  ///[return] hora inicial.
  List<String> get horaI => _horaI;
///[return] hora final.
  List<String> get horaF => _horaF;
///[return] identificador de materia.
  List<String> get idMateria => _idMateria;
}
