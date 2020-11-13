import 'EstudianteUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginForm extends StatefulWidget{
  @override
  _LoginFormState createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm>{

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: (){
          FocusScopeNode currentFocus = FocusScope.of(context);
          if(!currentFocus.hasPrimaryFocus){
            currentFocus.unfocus();
            }
          },
          child: Material(
            child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [const Color.fromRGBO(53, 132, 230, 1), Color.fromRGBO(53, 62, 123, 1)],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
                ),
              ),
            child: ListView(
              children: [
                logoSeccion(),
                textoSeccion(),
                botonSeccion(),
              ],
            ),
        ),
      ),
    );
  }

  signIn() async {//-----------------------------codigo para verificar login------------------------------
    Navigator.push(context, MaterialPageRoute(builder: (context) => EstudiantePagina()));  ////UNION CON LA PAGINA ESTUDIANTE

    
    print("Aqui se hara el codigo para ingresar");
  }

  Container botonSeccion(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: EdgeInsets.all(30.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: RaisedButton(
        onPressed: () {
            setState((){
            });
            signIn();
            },
            color: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Text("Ingresar", style: TextStyle(color: Colors.white)
            ),
      ),
    );
  }



  Container logoSeccion(){
    return Container(
      alignment: Alignment.center,
      //duration: Duration(milliseconds: 400),
      width: 200,
      height: 200,
      margin: EdgeInsets.only(top: 50),
      child:  Image(
        image: AssetImage('Assets/UsuarioCirculo.png'),
      )
    );
  }
}

TextEditingController idController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();


AnimatedContainer textoSeccion(){
  return AnimatedContainer(
    duration: Duration(milliseconds: 400),
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    margin: EdgeInsets.only(top: 200),
    child: Column(children: [
      txtID(" Email", 'Assets/Usuario.png'),
      SizedBox(height: 30.0),
      txtPassword(" Password",'Assets/Llave.png'),
    ],)
  );
}

//Los Metodos Utilizados en textSeccion() son:------------------------
TextFormField txtID(String titulo, String icono){
  return TextFormField(
    controller: idController,
    style: TextStyle(color: Colors.white),
    //textAlign: TextAlign.center,
    decoration: InputDecoration(
      hintText: titulo,
      hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      icon: ImageIcon(AssetImage(icono), color: Colors.white),
      ),
  );
}
TextFormField txtPassword(String titulo, String icono){
  return TextFormField(
    controller: passwordController,
    obscureText: true,
    style: TextStyle(color: Colors.white),
    //textAlign: TextAlign.center,
    decoration: InputDecoration(
      hintText: titulo,
      hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      icon: ImageIcon(AssetImage(icono), color: Colors.white),
      ),
  );
}
//-----------------------------------------------------------------