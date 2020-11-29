// To parse this JSON data, do
//
//     final alumno = alumnoFromJson(jsonString);

import 'dart:convert';
///Convierte json a objeto de tipo Alumno, [param] response.body (str).
Alumno alumnoFromJson(String str) => Alumno.fromJson(json.decode(str));
///Codifica atributos de Alumno a formato json,[param] Objeto de tipo Clase (data).
String alumnoToJson(Alumno data) => json.encode(data.toJson());
///Clase Alumno contiene métodos para decodificar formatos Json a objetos de tipo
/// Alumno y convertirlos a String.
class Alumno {
///Constructor de clase Alumno.
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
        this.asistencias,
        this.alumnoId,
    });

    List<Clase> clases;
    String id;
    String noControl;
    String carrera;
    int semestre;
    String especialidad;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    UsersPermissionsUser usersPermissionsUser;
    List<Asistencia> asistencias;
    String alumnoId;
///Decodifica json para convertirlo en objeto.
///[param] Recibe un Mapa (json)
///[return] Retorna un Alumno.
    factory Alumno.fromJson(Map<String, dynamic> json) => Alumno(
        clases: List<Clase>.from(json["clases"].map((x) => Clase.fromJson(x))),
        id: json["_id"],
        noControl: json["No_control"],
        carrera: json["carrera"],
        semestre: json["semestre"],
        especialidad: json["especialidad"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        usersPermissionsUser: UsersPermissionsUser.fromJson(json["users_permissions_user"]),
        asistencias: List<Asistencia>.from(json["asistencias"].map((x) => Asistencia.fromJson(x))),
        alumnoId: json["id"],
    );
///toJson()
///Convierte atributos de la clase Alumno a formato Json.
    Map<String, dynamic> toJson() => {
        "clases": List<dynamic>.from(clases.map((x) => x.toJson())),
        "_id": id,
        "No_control": noControl,
        "carrera": carrera,
        "semestre": semestre,
        "especialidad": especialidad,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "users_permissions_user": usersPermissionsUser.toJson(),
        "asistencias": List<dynamic>.from(asistencias.map((x) => x.toJson())),
        "id": alumnoId,
    };
}
///Clase Asistencia contiene métodos para decodificar formatos Json a objetos de tipo
/// Asistencia y convertirlos a String.
class Asistencia {
/// Constructor de clase Asistencia.
    Asistencia({
        this.id,
        this.publishedAt,
        this.asistencia,
        this.fecha,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.alumno,
        this.clase,
        this.asistenciaId,
    });

    String id;
    DateTime publishedAt;
    bool asistencia;
    DateTime fecha;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String alumno;
    String clase;
    String asistenciaId;
///Decodifica json para convertirlo en objeto.
///[param] Recibe un Mapa (json)
///[return] Retorna un Asistencia.
    factory Asistencia.fromJson(Map<String, dynamic> json) => Asistencia(
        id: json["_id"],
        publishedAt: DateTime.parse(json["published_at"]),
        asistencia: json["asistencia"],
        fecha: DateTime.parse(json["fecha"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        alumno: json["alumno"],
        clase: json["clase"],
        asistenciaId: json["id"],
    );
///toJson()
///Convierte atributos de la clase Asistencia a formato Json.
    Map<String, dynamic> toJson() => {
        "_id": id,
        "published_at": publishedAt.toIso8601String(),
        "asistencia": asistencia,
        "fecha": fecha.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "alumno": alumno,
        "clase": clase,
        "id": asistenciaId,
    };
}
///Clase "Clase" contiene métodos para decodificar formatos Json a objetos de tipo
/// Clase y convertirlos a String.
class Clase {
///Constructor de clase Clase.
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
        this.claseId,
    });

    String id;
    String horaInicial;
    String horaFinal;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String docente;
    String materia;
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
        docente: json["docente"],
        materia: json["materia"],
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
        "docente": docente,
        "materia": materia,
        "id": claseId,
    };
}
///Clase UsersPermissionsUser contiene métodos para decodificar formatos Json a objetos de tipo
/// UsersPermissionsUser y convertirlos a String.
class UsersPermissionsUser {
///Constructor de clase UsersPermissionsUser.
    UsersPermissionsUser({
        this.confirmed,
        this.blocked,
        this.id,
        this.username,
        this.email,
        this.nombre,
        this.apellidoPaterno,
        this.apellidoMaterno,
        this.perfil,
        this.provider,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.role,
        this.alumno,
        this.usersPermissionsUserId,
    });

    bool confirmed;
    bool blocked;
    String id;
    String username;
    String email;
    String nombre;
    String apellidoPaterno;
    String apellidoMaterno;
    int perfil;
    String provider;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String role;
    String alumno;
    String usersPermissionsUserId;
///Decodifica json para convertirlo en objeto.
///[param] Recibe un Mapa (json)
///[return] Retorna una UsersPermissionsUser.
    factory UsersPermissionsUser.fromJson(Map<String, dynamic> json) => UsersPermissionsUser(
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        nombre: json["nombre"],
        apellidoPaterno: json["apellido_paterno"],
        apellidoMaterno: json["apellido_materno"],
        perfil: json["perfil"],
        provider: json["provider"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        role: json["role"],
        alumno: json["alumno"],
        usersPermissionsUserId: json["id"],
    );
///toJson()
///Convierte atributos de la clase UsersPermissionsUser a formato Json.
    Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "blocked": blocked,
        "_id": id,
        "username": username,
        "email": email,
        "nombre": nombre,
        "apellido_paterno": apellidoPaterno,
        "apellido_materno": apellidoMaterno,
        "perfil": perfil,
        "provider": provider,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "role": role,
        "alumno": alumno,
        "id": usersPermissionsUserId,
    };
}