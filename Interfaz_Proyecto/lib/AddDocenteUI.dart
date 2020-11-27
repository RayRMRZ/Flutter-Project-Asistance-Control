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
            margin: EdgeInsets.symmetric(vertical: 40,horizontal: 30),
            child: ListView(
              children: [
                txtInput("Nombre", nameController),
                txtInput("Apellido Paterno", apellidoPaController),
                txtInput("Apellido Materno", apellidoMaController),
                txtInput("Area", areaController),
                txtInput("Email", emailController),
                txtPassword("Contraseña", passwordController),
                txtPassword("Confirmar Contraseña", password2Controller),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 90),
                child: FlatButton(
                  height: 40,
                  color: Color.fromRGBO(53, 62, 123, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  onPressed: (){/*AQUI METE NU ÑOGICA*/},
                  child: Text("Agregar", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }






Padding txtInput(String campo, TextEditingController controlador){
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
            hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)),
              focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none))
          ),
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
            //icon: ImageIcon(AssetImage(icono), color: Colors.white),
            suffixIcon: IconButton(
                    icon: Icon(
                _passwordVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                color: Color.fromRGBO(53, 62, 123, 1),
              ),
              onPressed: () => setState(()  {
                         _passwordVisible = !_passwordVisible;
                     })
            ),
          ),
        ),
      ),
    ),
  );
}
}