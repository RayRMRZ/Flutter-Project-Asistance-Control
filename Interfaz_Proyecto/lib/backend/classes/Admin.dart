import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as url;

class Admin {
  // ignore: non_constant_identifier_names
  static int _materia_sc;
  // ignore: non_constant_identifier_names
  static int _docente_sc;
  // ignore: non_constant_identifier_names
  static int _alumno_sc;
  static String urlD =
      'https://credencia.herokuapp.com/admin/plugins/content-manager/collectionType/application::docente.docente';
  static String urlA =
      'https://credencia.herokuapp.com/admin/plugins/content-manager/collectionType/application::alumno.alumno';
  static int get materia_sc => _materia_sc;
  static int get docente_sc => _docente_sc;
  static int get alumno_sc => _alumno_sc;

  addAlumno(String nombre, String apellidoP, String apellidoM, String email,
      String password) async {
    try {
      http.Response newUserAlumno =
          await http.post('https://credencia.herokuapp.com/auth/local/register', body: {
        "username": "${nombre}183610",
        "email": email,
        "password": password,
        "nombre": nombre,
        "apellido_paterno": apellidoP,
        "apellido_materno": apellidoM,
        "perfil": "2"
      });
      if (newUserAlumno.statusCode == 200 || newUserAlumno.statusCode == 201) {
        _alumno_sc = newUserAlumno.statusCode;
        if (await url.canLaunch(urlA)) {
          url.launch(urlA);
        } else {
          throw 'Could not launch----------------URL ';
        }
      } else {
        _alumno_sc = newUserAlumno.statusCode;
      }
    } catch (ex) {
      print('Excepción: $ex');
    }
  }

  addDocente(String nombre, String apellidoP, String apellidoM, String area,
      String email, String password) async {
    nombre = nombre.toUpperCase();
    apellidoP = apellidoP.toUpperCase();
    apellidoM = apellidoM.toUpperCase();
    try {
      http.Response newUserDocente =
          await http.post('https://credencia.herokuapp.com/auth/local/register', body: {
        "username": "${nombre}1836",
        "email": email,
        "password": password,
        "nombre": nombre,
        "apellido_paterno": apellidoP,
        "apellido_materno": apellidoM,
        "perfil": "1",
      });
      print('Aqui obtuvimos un ${newUserDocente.statusCode}');
      if (newUserDocente.statusCode == 201 ||newUserDocente.statusCode == 200 ) {
        _docente_sc = newUserDocente.statusCode;
        if (await url.canLaunch(urlD)) {
          url.launch(urlD);
        } else {
          throw 'Could not launch----------------URL ';
        }
        _docente_sc = newUserDocente.statusCode;
      } else {
        _docente_sc = newUserDocente.statusCode;
      }
    } catch (ex) {
      print('Excepción postDocente: $ex');
    }
  }

  addMateria(String materia) async {
    try {
      http.Response newMateria = await http.post(
          'https://credencia.herokuapp.com/materias',
          body: {"nombre_materia": materia});
      if (newMateria.statusCode == 200) {
        _materia_sc = 200;
      } else {
        _materia_sc = newMateria.statusCode;
      }
    } catch (ex) {
      print('Exepción: $ex');
    }
  }
}
