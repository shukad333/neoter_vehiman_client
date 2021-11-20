import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vehimanclient/model/entity_model.dart';
import 'package:vehimanclient/model/vehicle_model.dart';
import 'package:vehimanclient/rest/service_client.dart';
import 'package:vehimanclient/ui/new_vehicle.dart';
import 'package:http/http.dart' as http;


class Entities extends StatefulWidget {
  const Entities({Key? key}) : super(key: key);

  @override
  _EntitiesState createState() => _EntitiesState();
}

class _EntitiesState extends State<Entities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicles"),
      ),
      body:  FutureBuilder<List<Entity>>(
        future: fetchEntites(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Entity>? data = snapshot.data;
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


  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => Card(

          child: _tile(data[index].name, data[index].subType),
          elevation: 6,
          margin: EdgeInsets.all(10),

          ),
        );
        // itemBuilder: (context, index) {
        //   return _tile(data[index].name, data[index].number);
        // });

  }

  ListTile _tile(String name, String subType) => ListTile(
    title: Text(name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),

    subtitle: Text(subType),

    trailing: Icon(
    Icons.car_repair,
    color: Colors.blue[500],
  )
  );
}

