import 'package:Interfaz_Proyecto/Dialogs.dart';
import 'package:Interfaz_Proyecto/backend/Validacion.dart';
import 'package:Interfaz_Proyecto/backend/classes/Admin.dart';
import 'package:flutter/material.dart';

class AddDocentePagina extends StatefulWidget {
  @override
  _AddDocentePagina createState() => _AddDocentePagina();
}

final nameController = new TextEditingController();
final apellidoPaController = new TextEditingController();
final apellidoMaController = new TextEditingController();
final areaController = new TextEditingController();
final claseController = new TextEditingController();
final emailController = new TextEditingController();
final passwordController = new TextEditingController();
final password2Controller = new TextEditingController();

class _AddDocentePagina extends State<AddDocentePagina> {
  @override
  Widget build(BuildContext context) {
    Admin admin = new Admin();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              "Agregar Docente",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
            backgroundColor: Color.fromRGBO(53, 62, 123, 1),
          ),
        ),
        body: Container(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: ListView(children: [
              txtInput("Nombre", nameController),
              txtInput("Apellido Paterno", apellidoPaController),
              txtInput("Apellido Materno", apellidoMaController),
              txtInput("Area", areaController),
              txtInput("Email", emailController),
              txtPassword("Contraseña", passwordController),
              txtPassword("Confirmar Contraseña", password2Controller),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 90),
                child: FlatButton(
                  height: 40,
                  color: Color.fromRGBO(53, 62, 123, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  onPressed: () {
                    Validation validar = new Validation();
                    if (validar.formatString(nameController.text) &&
                        validar.formatString(apellidoPaController.text) &&
                        validar.formatString(apellidoMaController.text) &&
                        validar.formatString(areaController.text) &&
                        validar.isCorrect(emailController.text)) {
                      if (passwordController.text != password2Controller.text) {
                        helperPass = "               " + "No coinciden";
                        Dialogs.confirmAbortDialog(
                            context: context,
                            title: 'Contraseña',
                            body: 'Las contraseñas no coinciden!');
                      } else {
                        admin.addDocente(
                            nameController.text,
                            apellidoPaController.text,
                            apellidoMaController.text,
                            areaController.text,
                            emailController.text,
                            passwordController.text);
                        if (Admin.docente_sc == 201 ||
                            Admin.docente_sc == 200) {
                          Dialogs.confirmAbortDialog(
                              context: context,
                              title: 'Registro',
                              body: 'Docente registrado exitosamente');
                          nameController.text = '';
                          apellidoMaController.text = '';
                          apellidoPaController.text = '';
                          areaController.text = '';
                          claseController.text = '';
                          emailController.text = '';
                          passwordController.text = '';
                          password2Controller.text = '';
                          Dialogs.confirmAbortDialog(
                            context: context,
                            title: 'Recordatorio:',
                            body: 'Recuerda terminar el registro de docentes\n' +
                                'en Strapi https://credencia.herokuapp.com/admin/auth/login',
                          );
                        } else {
                          Dialogs.confirmAbortDialog(
                              context: context,
                              title: 'Advertencia',
                              body: 'El docente no se ha podido añadir\n' +
                                  'compruebe si ya existe o intente de nuevo!');
                        }
                      }
                    } else {
                      Dialogs.confirmAbortDialog(
                          context: context,
                          title: 'Error',
                          body: 'Compruebe que sus datos sean validos');
                    }
                  },
                  child: Text("Agregar",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Padding txtInput(String campo, TextEditingController controlador) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color.fromRGBO(53, 62, 123, 0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: TextFormField(
            cursorWidth: 3,
            cursorHeight: 25,
            controller: controlador,
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: campo,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none))),
          ),
        ),
      ),
    );
  }

  bool _passwordVisible = false;
  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  String helperPass = "";
  Color helperColor = Colors.purple[300];

  Padding txtPassword(String titulo, TextEditingController passwordController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color.fromRGBO(53, 62, 123, 0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            cursorWidth: 3,
            cursorHeight: 25,
            textAlign: TextAlign.center,
            controller: passwordController,
            obscureText: !_passwordVisible,
            style: TextStyle(color: Colors.black),
            //textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none)),
              hintText: titulo,
              hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
              helperText: helperPass,
              helperStyle: TextStyle(color: helperColor),
              //icon: ImageIcon(AssetImage(icono), color: Colors.white),
              suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    color: Color.fromRGBO(53, 62, 123, 1),
                  ),
                  onPressed: () => setState(() {
                        _passwordVisible = !_passwordVisible;
                      })),
            ),
          ),
        ),
      ),
    );
  }
}
