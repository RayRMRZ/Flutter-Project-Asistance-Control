import 'package:Interfaz_Proyecto/Dialogs.dart';
import 'package:Interfaz_Proyecto/backend/Validacion.dart';
import 'package:Interfaz_Proyecto/backend/classes/Admin.dart';
import 'package:flutter/material.dart';

class AddAlumnoPagina extends StatefulWidget {
  @override
  _AddAlumnoPagina createState() => _AddAlumnoPagina();
}

final nameController = new TextEditingController();
final apellidoPaController = new TextEditingController();
final apellidoMaController = new TextEditingController();
final carreraController = new TextEditingController();
final numeroControlController = new TextEditingController();
final semestreController = new TextEditingController();
final especialidadController = new TextEditingController();
final emailController = new TextEditingController();
final passwordController = new TextEditingController();
final password2Controller = new TextEditingController();

class _AddAlumnoPagina extends State<AddAlumnoPagina> {
  final List<String> semestres = [
    "Semestre",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  String semestreSeleccionado = "Semestre";

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
              "Agregar Alumno",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
            backgroundColor: Color.fromRGBO(53, 132, 230, 1),
          ),
        ),
        body: Container(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: ListView(children: [
              txtInput("Nombre", nameController),
              txtInput("Apellido Paterno", apellidoPaController),
              txtInput("Apellido Materno", apellidoMaController),
              txtInput("Carrera", carreraController),
              txtInput("Numero de Control", numeroControlController),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromRGBO(53, 62, 123, 0.1),
                ),
                margin: EdgeInsets.symmetric(horizontal: 70),
                child: Center(
                  child: DropdownButton<String>(
                    value: semestreSeleccionado,
                    onChanged: (valorSemestre) {
                      setState(() {
                        semestreSeleccionado = valorSemestre;
                      });
                    },
                    items: semestres
                        .map<DropdownMenuItem<String>>((valorSemestre) {
                      return DropdownMenuItem(
                        child: Center(child: Text(valorSemestre)),
                        value: valorSemestre,
                      );
                    }).toList(),
                  ),
                ),
              ),
              txtInput("Especialidad", especialidadController),
              txtInput("Email", emailController),
              txtPassword("Contraseña", passwordController),
              txtPassword("Confirmar Contraseña", password2Controller),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                child: FlatButton(
                  height: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  color: Color.fromRGBO(53, 132, 230, 1),
                  onPressed: () {
                    Validation validar = new Validation();
                    if (validar.formatString(nameController.text) &&
                        validar.formatString(apellidoPaController.text) &&
                        validar.formatString(apellidoMaController.text) &&
                        validar.formatString(carreraController.text) &&
                        validar.formatString(especialidadController.text) &&
                        validar.isCorrect(emailController.text) &&
                        validar.formatNcontrol(numeroControlController.text) &&
                        validar.formatNSem(semestreSeleccionado)) {
                      if (passwordController.text != password2Controller.text) {
                        helperPass = "                 " + "No coinciden";
                        Dialogs.confirmAbortDialog(
                            context: context,
                            title: 'Contraseña',
                            body: 'Las contraseñas no coinciden!');
                      } else {
                        admin.addAlumno(
                            nameController.text,
                            apellidoPaController.text,
                            apellidoMaController.text,
                            emailController.text,
                            passwordController.text);
                        if (Admin.alumno_sc == 201 || Admin.alumno_sc == 200) {
                          Dialogs.confirmAbortDialog(
                              context: context,
                              title: 'Registro',
                              body: 'Alumno registrado exitosamente');

                          nameController.text = "";
                          apellidoPaController.text = "";
                          apellidoMaController.text = "";
                          emailController.text = "";
                          passwordController.text = "";
                          semestreSeleccionado = "";
                          carreraController.text = "";
                          especialidadController.text = "";
                          numeroControlController.text = "";
                          Dialogs.confirmAbortDialog(
                            context: context,
                            title: 'Recordatorio:',
                            body: 'Recuerda terminar el registro del alumno en Strapi\n' +
                                'https://credencia.herokuapp.com/admin/auth/login',
                          );
                        } else {
                          Dialogs.confirmAbortDialog(
                              context: context,
                              title: 'Advertencia',
                              body: 'El alumno puede no haberse añadido,\n' +
                                  'verifique si ya existe o intente de nuevo!');
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
