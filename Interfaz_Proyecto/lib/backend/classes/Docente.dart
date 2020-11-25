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
    });

    String id;
    String area;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String usersPermissionsUser;
    String docenteId;

    factory Docente.fromJson(Map<String, dynamic> json) => Docente(
        id: json["_id"],
        area: json["area"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        usersPermissionsUser: json["users_permissions_user"],
        docenteId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "area": area,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "users_permissions_user": usersPermissionsUser,
        "id": docenteId,
    };
}