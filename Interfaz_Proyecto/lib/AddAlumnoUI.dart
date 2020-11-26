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
  final List<String> semestres = ["Semestre","1","2", "3", "4","5","6","7","8","9","10","11","12"];
  String semestreSeleccionado = "Semestre";



  
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
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
            child: ListView(
              children: [
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
                        onChanged: (value){
                          setState((){
                            semestreSeleccionado = value;
                          });
                        },
                        items: semestres.map<DropdownMenuItem<String>>((value){
                          return DropdownMenuItem(
                            child: Text(value, style: TextStyle(),),
                            value: value,
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
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    color: Color.fromRGBO(53, 132, 230, 1),
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
          controller: controlador,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: campo,
            hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)
            )
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
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: TextFormField(
          textAlign: TextAlign.center,
          controller: passwordController,
          obscureText: !_passwordVisible,
          style: TextStyle(color: Colors.black),
          //textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)
            ),
            hintText: titulo,
            hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
            //icon: ImageIcon(AssetImage(icono), color: Colors.white),
            suffixIcon: IconButton(
                    icon: Icon(
                _passwordVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                color: Colors.black,
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