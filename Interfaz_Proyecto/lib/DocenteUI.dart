import 'package:Interfaz_Proyecto/ConfigDocente.dart';
import 'package:Interfaz_Proyecto/FlushBar_Snack.dart';
import 'package:Interfaz_Proyecto/LoginUI.dart';

import 'package:Interfaz_Proyecto/backend/classes/DataDocente.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'AdminUI.dart';
import 'HorarioDocente.dart';

class DocentePagina extends StatefulWidget {
  final String response;
  DocentePagina(this.response);

  @override
  _DocentePagina createState() => _DocentePagina();
}

class _DocentePagina extends State<DocentePagina> {
  var result = "Pasar lista";
  DataDocente docente;
///Método para escanear Qr del alumno.
  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult.toString();
        print("Generando la asistencia ${docente.addAssistence(result,materiaSeleccionada,context)}");
        result = '¿Pasar una nueva asistencia?';
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "El permiso de la cámara fue denegado.";
        });
      } else {
        setState(() {
          result = "Error$e";
          FlushBar_Snack.errorQrMsg(context, result);
        });
      }
    } on FormatException {
      setState(() {
        result = 'Aún no ha escaneado nada, ¿escanear?';
        FlushBar_Snack.errorQrMsg(
            context, 'Presionaste el boton antes de escanear algo.');
      });
    } catch (e) {
      setState(() {
        FlushBar_Snack.errorQrMsg(context, "Error$e");
      });
    }
  }
  ///Método para refrescar listview dentro del (body.
  Future<Null> _refreshSelect() async {
    try {
      if (materias.length == 1) {
        print(docente.nombresMateria);
        materias.addAll(docente.nombresMateria);
        clases.addAll(docente.horaI);
        await Future.delayed(Duration(seconds: 3));
      } else {
        print(materias);
      }
    } catch (ex) {
      print('Ah ocurrido un error');
    }
  }

  List<String> materias = ['Materias:'];
  String materiaSeleccionada = "Materias:";

  List<String> clases = ["Hora"];
  String claseSeleccionada = "Hora";

  Widget build(BuildContext context) {
    docente = new DataDocente(widget.response);
    return Scaffold(
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(120)),
        child: Drawer(
          child: Container(
            color: Color.fromRGBO(53, 132, 230, 1),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  height: 170,
                  child: UserAccountsDrawerHeader(
                    accountName: Text(docente
                        .nombre), //Se tiene que adaptar a la info. del docente
                    accountEmail: Text(docente
                        .email), //Se tiene que adaptar a la info. del docente

                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage(
                          "Assets/Usuario.png"), //Se tiene que adaptar a la info. del docente
                    ),
                  ),
                ),
                CustomListTile(Icons.calendar_today, "Horarios",
                    () => {Navigator.push(context,MaterialPageRoute(builder: (context) => HorarioDocentePagina())) }),
                CustomListTile(Icons.list_alt_rounded, "Ver Listas",
                    () => {/*FUNCION DE LO QUE HACE EL BOTON*/}),
                CustomListTile(
                    Icons.admin_panel_settings_rounded,
                    "Modo Admin",
                    () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminPagina()))
                        }),
                CustomListTile(Icons.picture_as_pdf_rounded, "Generar PDF's",
                    () => {/*FUNCION DE LO QUE HACE EL BOTON*/}),
                CustomListTile(Icons.settings, "Configuración",
                    () => {Navigator.push(context,MaterialPageRoute(builder: (context) => ConfigDocente())) }),
                CustomListTile(
                    Icons.sensor_door_rounded,
                    "Salir",
                    () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginForm(context)))
                        }),
              ],
            ),
          ),
        ),
      ),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Docente",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
          backgroundColor: Color.fromRGBO(53, 62, 123, 1),
        ),
      ),

      // Seccion abajo del AppBar-----------------------------------------------------------------------
      //body:
      body: RefreshIndicator(
        color: Color.fromRGBO(53, 132, 230, 1),
        onRefresh: _refreshSelect,
        child: ListView(children: <Widget>[
          Container(
              margin: EdgeInsets.only(
                  top: 60.0, left: 10.0, right: 10.0, bottom: 20),
              height: 200,
              child: FlareActor(
                "Assets/Qr loading.flr",
                animation: "scanning",
                color: Color.fromRGBO(53, 62, 123, 1),
              ) //animation:(show|loading|camera|scanning)
              ),
          Container(
              height: 30,
              child: FlareActor(
                "Assets/wait.flr",
                animation: "loading",
                color: Color.fromRGBO(53, 132, 230, 1),
              )),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromRGBO(53, 62, 123, 0.1),
                    ),
                    margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: materiaSeleccionada,
                          onChanged: (valorMateria) {
                            setState(() {
                              materiaSeleccionada = valorMateria;
                            });
                          },
                          items: materias
                              .map<DropdownMenuItem<String>>((valorMateria) {
                            return DropdownMenuItem(
                              child: Center(child: Text(valorMateria)),
                              value: valorMateria,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromRGBO(53, 62, 123, 0.1),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: claseSeleccionada,
                        onChanged: (valorClase) {
                          setState(() {
                            claseSeleccionada = valorClase;
                          });
                        },
                        items:
                            clases.map<DropdownMenuItem<String>>((valorClase) {
                          return DropdownMenuItem(
                            child: Center(child: Text(valorClase)),
                            value: valorClase,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: OutlineButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(result, style: TextStyle(fontSize: 18)),
              ),
              onPressed: _scanQR,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              color: Colors.white54,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  //utilizado para los botones del menu --------------------------------

  IconData icono;
  String texto;
  Function onTap;

  CustomListTile(this.icono, this.texto, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(53, 62, 123, 1), width: 2))),
        child: InkWell(
          onTap: onTap,
          child: Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Icon(
                icono,
                color: Colors.white,
              ),
            ),
            Text(
              texto,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

//************************************************************************************************************************* */
