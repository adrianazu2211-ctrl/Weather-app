class UserModel {
  DateTime createdAt;
  String name;
  String avatar;
  String? id;

  UserModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> mapita) => UserModel(
    createdAt: DateTime.parse(mapita["createdAt"]),
    name: mapita["name"],
    avatar: mapita["avatar"],
    id: mapita["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "name": name,
    "avatar": avatar,
    "id": id,
  };
}
