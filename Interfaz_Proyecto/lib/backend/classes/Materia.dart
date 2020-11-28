// To parse this JSON data, do
//
//     final materia = materiaFromJson(jsonString);

import 'dart:convert';

Materia materiaFromJson(String str) => Materia.fromJson(json.decode(str));

String materiaToJson(Materia data) => json.encode(data.toJson());

class Materia {
    Materia({
        this.id,
        this.nombreMateria,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.clases,
        this.materiaId,
    });

    String id;
    String nombreMateria;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<Clase> clases;
    String materiaId;

    factory Materia.fromJson(Map<String, dynamic> json) => Materia(
        id: json["_id"],
        nombreMateria: json["nombre_materia"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        clases: List<Clase>.from(json["clases"].map((x) => Clase.fromJson(x))),
        materiaId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre_materia": nombreMateria,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "clases": List<dynamic>.from(clases.map((x) => x.toJson())),
        "id": materiaId,
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