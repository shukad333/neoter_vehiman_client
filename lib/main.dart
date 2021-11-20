import 'package:flutter/material.dart';
import 'package:vehimanclient/ui/entities.dart';
import 'package:vehimanclient/ui/vehicles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vehi Man',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Entities(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Color(0x66623EFF),
            ),
          )
        ],
      ),
    );
  }
}


