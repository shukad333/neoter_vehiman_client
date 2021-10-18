

class Vehicle {

  final String name;
  final String number;

  Vehicle({
    required this.name,
    required this.number
});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      name: json['name'],
      number: json['number'],
    );
  }
}