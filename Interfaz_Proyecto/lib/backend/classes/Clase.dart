// To parse this JSON data, do
//
//     final clase = claseFromJson(jsonString);

import 'dart:convert';
///Convierte json a objeto de tipo Clase, [param] response.body (str).
Clase claseFromJson(String str) => Clase.fromJson(json.decode(str));
///Codifica atributos de Clase a formato json,[param] Objeto de tipo Clase (data).
String claseToJson(Clase data) => json.encode(data.toJson());
///Clase "Clase" contiene métodos para decodificar formatos Json a objetos de tipo
/// Clase y convertirlos a String.
class Clase {
    Clase({
        this.id,
        this.horaInicial,
        this.horaFinal,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.docente,
        this.materia,
        this.asistencias,
        this.alumnos,
        this.claseId,
    });

    String id;
    String horaInicial;
    String horaFinal;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    Docente docente;
    Docente materia;
    List<Asistencia> asistencias;
    List<Alumno> alumnos;
    String claseId;
///Decodifica json para convertirlo en objeto.
///[param] Recibe un Mapa (json)
///[return] Retorna una Clase.
    factory Clase.fromJson(Map<String, dynamic> json) => Clase(
        id: json["_id"],
        horaInicial: json["hora_inicial"],
        horaFinal: json["hora_final"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        docente: Docente.fromJson(json["docente"]),
        materia: Docente.fromJson(json["materia"]),
        asistencias: List<Asistencia>.from(json["asistencias"].map((x) => Asistencia.fromJson(x))),
        alumnos: List<Alumno>.from(json["alumnos"].map((x) => Alumno.fromJson(x))),
        claseId: json["id"],
    );
///toJson()
///Convierte atributos de la clase Clase a formato Json.
    Map<String, dynamic> toJson() => {
        "_id": id,
        "hora_inicial": horaInicial,
        "hora_final": horaFinal,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "docente": docente.toJson(),
        "materia": materia.toJson(),
        "asistencias": List<dynamic>.from(asistencias.map((x) => x.toJson())),
        "alumnos": List<dynamic>.from(alumnos.map((x) => x.toJson())),
        "id": claseId,
    };
}

class Alumno {
    Alumno({
        this.clases,
        this.id,
        this.noControl,
        this.carrera,
        this.semestre,
        this.especialidad,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.usersPermissionsUser,
        this.alumnoId,
    });

    List<String> clases;
    String id;
    String noControl;
    String carrera;
    int semestre;
    String especialidad;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String usersPermissionsUser;
    String alumnoId;

    factory Alumno.fromJson(Map<String, dynamic> json) => Alumno(
        clases: List<String>.from(json["clases"].map((x) => x)),
        id: json["_id"],
        noControl: json["No_control"],
        carrera: json["carrera"],
        semestre: json["semestre"],
        especialidad: json["especialidad"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        usersPermissionsUser: json["users_permissions_user"],
        alumnoId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "clases": List<dynamic>.from(clases.map((x) => x)),
        "_id": id,
        "No_control": noControl,
        "carrera": carrera,
        "semestre": semestre,
        "especialidad": especialidad,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "users_permissions_user": usersPermissionsUser,
        "id": alumnoId,
    };
}

class Asistencia {
    Asistencia({
        this.id,
        this.fecha,
        this.asistencia,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.alumno,
        this.clase,
        this.asistenciaId,
    });

    String id;
    DateTime fecha;
    bool asistencia;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String alumno;
    String clase;
    String asistenciaId;

    factory Asistencia.fromJson(Map<String, dynamic> json) => Asistencia(
        id: json["_id"],
        fecha: DateTime.parse(json["fecha"]),
        asistencia: json["asistencia"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        alumno: json["alumno"],
        clase: json["clase"],
        asistenciaId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fecha": fecha.toIso8601String(),
        "asistencia": asistencia,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "alumno": alumno,
        "clase": clase,
        "id": asistenciaId,
    };
}

class Docente {
    Docente({
        this.id,
        this.area,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.usersPermissionsUser,
        this.docenteId,
        this.nombreMateria,
    });

    String id;
    String area;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String usersPermissionsUser;
    String docenteId;
    String nombreMateria;

    factory Docente.fromJson(Map<String, dynamic> json) => Docente(
        id: json["_id"],
        area: json["area"] == null ? null : json["area"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        usersPermissionsUser: json["users_permissions_user"] == null ? null : json["users_permissions_user"],
        docenteId: json["id"],
        nombreMateria: json["nombre_materia"] == null ? null : json["nombre_materia"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "area": area == null ? null : area,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "users_permissions_user": usersPermissionsUser == null ? null : usersPermissionsUser,
        "id": docenteId,
        "nombre_materia": nombreMateria == null ? null : nombreMateria,
    };
}