// To parse this JSON data, do
//
//     final docente = docenteFromJson(jsonString);

import 'dart:convert';

Docente docenteFromJson(String str) => Docente.fromJson(json.decode(str));

String docenteToJson(Docente data) => json.encode(data.toJson());

class Docente {
    Docente({
        this.id,
        this.area,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.usersPermissionsUser,
        this.clases,
        this.docenteId,
    });

    String id;
    String area;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    UsersPermissionsUser usersPermissionsUser;
    List<Clase> clases;
    String docenteId;

    factory Docente.fromJson(Map<String, dynamic> json) => Docente(
        id: json["_id"],
        area: json["area"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        usersPermissionsUser: UsersPermissionsUser.fromJson(json["users_permissions_user"]),
        clases: List<Clase>.from(json["clases"].map((x) => Clase.fromJson(x))),
        docenteId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "area": area,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "users_permissions_user": usersPermissionsUser.toJson(),
        "clases": List<dynamic>.from(clases.map((x) => x.toJson())),
        "id": docenteId,
    };
}

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

class UsersPermissionsUser {
    UsersPermissionsUser({
        this.confirmed,
        this.blocked,
        this.id,
        this.nombre,
        this.perfil,
        this.apellidoMaterno,
        this.apellidoPaterno,
        this.username,
        this.email,
        this.provider,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.role,
        this.docente,
        this.usersPermissionsUserId,
    });

    bool confirmed;
    bool blocked;
    String id;
    String nombre;
    int perfil;
    String apellidoMaterno;
    String apellidoPaterno;
    String username;
    String email;
    String provider;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String role;
    String docente;
    String usersPermissionsUserId;

    factory UsersPermissionsUser.fromJson(Map<String, dynamic> json) => UsersPermissionsUser(
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        id: json["_id"],
        nombre: json["nombre"],
        perfil: json["perfil"],
        apellidoMaterno: json["apellido_materno"],
        apellidoPaterno: json["apellido_paterno"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        role: json["role"],
        docente: json["docente"],
        usersPermissionsUserId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "blocked": blocked,
        "_id": id,
        "nombre": nombre,
        "perfil": perfil,
        "apellido_materno": apellidoMaterno,
        "apellido_paterno": apellidoPaterno,
        "username": username,
        "email": email,
        "provider": provider,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "role": role,
        "docente": docente,
        "id": usersPermissionsUserId,
    };
}