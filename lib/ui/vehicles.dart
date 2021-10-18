import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vehimanclient/model/vehicle_model.dart';
import 'package:vehimanclient/ui/new_vehicle.dart';
import 'package:http/http.dart' as http;


class Vehicles extends StatefulWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  _VehiclesState createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicles"),
      ),
      body:  FutureBuilder<List<Vehicle>>(
        future: fetchVehicles(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Vehicle>? data = snapshot.data;
            return _jobsListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>{
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new NewVehicle()))
        },
      ),
    );

  }

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

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Card(

          child: _tile(data[index].name, data[index].number),
          elevation: 6,
          margin: EdgeInsets.all(10),

          ),
        );
        // itemBuilder: (context, index) {
        //   return _tile(data[index].name, data[index].number);
        // });

  }

  ListTile _tile(String name, String number) => ListTile(
    title: Text(name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),

    subtitle: Text(number),

    trailing: Icon(
    Icons.car_repair,
    color: Colors.blue[500],
  )
  );
}

