

class Entity {
  final String id;
  final String name;
  final bool active;
  final String type;
  final String subType;

  Entity({
    required this.id,
    required this.name,
    required this.active,
    required this.type,
    required this.subType,
});

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      id: json['id'],
      name: json['name'],
      active: json['active'],
      type: json['type'],
      subType: json['subType'],
    );
  }
}