import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class HorarioDocentePagina extends StatefulWidget {
  @override
  _HorarioDocentePagina createState() => _HorarioDocentePagina();
}

class _HorarioDocentePagina extends State<HorarioDocentePagina> {
  CalendarController _controller;
  Map<DateTime,List<dynamic>> _eventos;
  // ignore: unused_field
  List<dynamic> _eventoSeleccionado;
  


  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventos = {};
    _eventoSeleccionado = [];
  } 

  Map<String,dynamic> encodeMap(Map<DateTime,dynamic> map){
    Map<String,dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime,dynamic> decodeMap(Map<String,dynamic> map){
    Map<DateTime,dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Mi Horario",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
          backgroundColor: Color.fromRGBO(53, 62, 123, 1),
        ),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _eventos,
              locale: 'es_MX',
              availableCalendarFormats: const {CalendarFormat.week: "semana", CalendarFormat.month: "mes"},
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                //Estilos del calendario
                ),
              calendarController: _controller,
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonShowsNext: false,
                ),
              onDaySelected: (context,date,events) {
                setState(() {
                  _eventoSeleccionado = events;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}