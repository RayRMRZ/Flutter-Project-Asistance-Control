class Role {
  Role({
    this.id,
    this.name,
    this.description,
    this.type,
    this.v,
    this.roleId,
  });

  String id;
  String name;
  String description;
  String type;
  int v;
  String roleId;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        v: json["v"],
        roleId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "type": type,
        "v": v,
        "id": roleId,
      };
}