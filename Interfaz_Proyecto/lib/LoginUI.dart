import 'package:Interfaz_Proyecto/backend/ControlVentanas.dart';
import 'package:Interfaz_Proyecto/FlushBar_Snack.dart';
import 'backend/Validacion.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'EstudianteUI.dart';
import 'DocenteUI.dart';

// ignore: must_be_immutable
class LoginForm extends StatefulWidget {
  BuildContext contextMain;
  LoginForm(this.contextMain);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  FlutterLocalNotificationsPlugin fltrNotification;
  @override
  Widget build(BuildContext contextLogin) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(contextLogin);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(53, 132, 230, 1),
                  Color.fromRGBO(53, 62, 123, 1)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
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
Validation validation = new Validation();
///Método de inicio en login.
///Ejecuta instrucciones de validación y control de pantallas.
  signIn() async {
    
    String email = idController.text;
    String password = passwordController.text;

    Control control = new Control();
    

    print('El correo es de usuario: ${control.inicio(email)}');

    if (validation.isCorrect(email)) {
      
      /* print('El correo: $email ===> es valido'); */
      try{
            if (await validation.exists(email, password, control)==true) {
        if (control.pagDoc == true) {
          helperEmail = "";
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DocentePagina(validation.sendResponse())));     
             
        } else {
          helperEmail = "";
          FocusScope.of(context).requestFocus(FocusNode());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EstudiantePagina(validation.sendResponse())));
                      FlushBar_Snack.welcomeMsg(context);
                      FocusScope.of(context).requestFocus(FocusNode());
        }
      } else {}
      }catch(ex){
        FlushBar_Snack.showConexionError(context);
        print('Excepción $ex');
      }
    } else {
      helperEmail = 'El correo es inválido';
    }
  }

  Container botonSeccion() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: EdgeInsets.all(30.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            signIn();
            showNotification(); 
          });
        },
        color: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text('Ingresar', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  AnimatedContainer logoSeccion() {
    return AnimatedContainer(
      curve: Curves.easeInOutBack,
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.only(top: tp),
      child: Column(
        children: [
          AnimatedContainer(
              curve: Curves.easeInOutBack,
              duration: Duration(milliseconds: 400),
              height: h,
              child: Image(image: AssetImage('Assets/Check In Logo.png'))),
          AnimatedContainer(
              curve: Curves.easeInOutBack,
              duration: Duration(milliseconds: 500),
              height: h / 3,
              margin: EdgeInsets.only(top: tp / 3),
              child: Image(image: AssetImage('Assets/Check In Box.png'))),
        ],
      ),
    );
  }


final idController = new TextEditingController();
final passwordController = new TextEditingController();
String msgValidation = "", helperEmail = "";

Focus textoSeccion() {
  return Focus(
    onFocusChange: (hasFocus) {
      if (hasFocus) {
        tp = 20;
        h = 100;
      } else {
        tp = 60;
        h = 200;
      }
    },
    child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOutBack,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        margin: EdgeInsets.only(top: tp), //top: 0
        child: Column(
          children: [
            txtEmail(" Email", 'Assets/Usuario.png'),
            SizedBox(height: 20.0),
            txtPassword(" Password", 'Assets/Llave.png'),
          ],
        )),
    );
  }
  double tp=60,h=200;//Variables de modificación texto y boton sección.


//Los Metodos Utilizados en textSeccion() son:------------------------
  TextFormField txtEmail(String titulo, String icono) {
    return TextFormField(
      controller: idController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
      hintText: titulo,
      hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      helperText: helperEmail, //Muestra la validación de correo.
      helperStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      icon: ImageIcon(AssetImage(icono), color: Colors.white),
      ),
    );
  }
  ///Método para mostrar notificaciones locales.
    Future showNotification()async{
    var androidDetails=new AndroidNotificationDetails('ID', 'Check-In', 'Notificación',importance: Importance.max);
    var iSODetails=new IOSNotificationDetails();
    var generalNotificationsDetails=new NotificationDetails(android: androidDetails,iOS: iSODetails);
    /* await fltrNotification.show(0, 'Check-In', 'Faltan 5 min para tu siguiente clase', 
    generalNotificationsDetails,payload: 'Visualiza tu horario de clases'); */
    /* FlushBar_Snack.notifSelected(context,'Tienes notificaciones importantes por ver!' ); */
    var scheduleTime=DateTime.now().add(new Duration( seconds: 150));
    // ignore: deprecated_member_use
    fltrNotification.schedule(0, 'Check-In', 'Faltan 10 min para tu siguiente clase', scheduleTime,
     generalNotificationsDetails,payload: 'Visualiza tu horario de clases');
  }
  bool _passwordVisible = false;
  @override
  ///Constructor de inicio.
  void initState() {
    super.initState();
    var androidInitialize= new AndroidInitializationSettings('icon_app');
    var iOSinitialize=new IOSInitializationSettings();
    var macOsInitialize=new MacOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(android: androidInitialize,iOS: iOSinitialize,macOS: macOsInitialize);
    fltrNotification =new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,onSelectNotification: notifSelected);
    _passwordVisible = false;
  }
  ///Método de selección de notificación local.
  Future notifSelected(String payload) async {
  FlushBar_Snack.notifSelected(context,payload);
  }
  TextFormField txtPassword(String titulo, String icono) {
  return TextFormField(
    controller: passwordController,
    obscureText: !_passwordVisible,
    //onTap: (){tp=50; w=100; h=300;},
    style: TextStyle(color: Colors.white),
    //textAlign: TextAlign.center,
    decoration: InputDecoration(
      hintText: titulo,
      hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      icon: ImageIcon(AssetImage(icono), color: Colors.white),
      suffixIcon: IconButton(
              icon: Icon(
          _passwordVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded,
          color: Colors.white,
        ),
        onPressed: () => setState(()  {
                   _passwordVisible = !_passwordVisible;
               })
      ),
    ),
  );
}
}