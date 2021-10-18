import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vehimanclient/model/vehicle_model.dart';
import 'package:http/http.dart' as http;

class NewVehicle extends StatefulWidget {
  const NewVehicle({Key? key}) : super(key: key);

  @override
  _NewVehicleState createState() => _NewVehicleState();
}

class _NewVehicleState extends State<NewVehicle> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  bool visible = false ;

  loadProgress() {
    if (visible == true) {
      setState(() {
        visible = false;
      });
    }
    else {
      setState(() {
        visible = true;
      });
    }
  }

  Future<Vehicle> createPost(Vehicle vehicle) async{
    String url = 'http://10.0.2.2:8080/vehicles';
    final response = await http.post(Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: jsonEncode(<String,String>{"name":vehicle.name,"number":vehicle.number}),
    );
    print(response.statusCode);
    setState(() {
      loadProgress();
    });
    return Vehicle.fromJson(jsonDecode(response.body));
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("New Vehicle"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name eg:Verna',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _numberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number KL72B4771',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("Save"),
                  onPressed: (){
                  setState(() {
                    Vehicle vehicle = Vehicle(name: _nameController.text, number: _numberController.text);
                    loadProgress();
                    createPost(vehicle);
                  });





                  },
                ),
              ],
            ),
          ),
          Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: visible,
              child: Container(
                  margin: EdgeInsets.only(top: 50, bottom: 30),
                  child: CircularProgressIndicator()
              )
          )
        ],
      ),
    );
  }
}
