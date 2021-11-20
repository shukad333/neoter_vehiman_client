

import 'dart:convert';

import 'package:vehimanclient/model/entity_model.dart';
import 'package:vehimanclient/model/vehicle_model.dart';
import 'package:http/http.dart' as http;

Future<List<Vehicle>> fetchVehicles() async {

  final url = 'http://10.0.2.2:8080/vehicles';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((vehicle) => new  Vehicle.fromJson(vehicle)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}


Future<List<Entity>> fetchEntites() async {

  final url = 'http://10.0.2.2:8080/entities';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((entity) => new  Entity.fromJson(entity)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}
