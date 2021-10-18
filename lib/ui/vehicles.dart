import 'package:flutter/material.dart';
import 'package:vehimanclient/ui/new_vehicle.dart';

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
     body: Center(
       child: Column(

       )),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: ()=>{
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new NewVehicle()))
         },
       ),

    );
  }
}
