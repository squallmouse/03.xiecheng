import 'package:flutter/material.dart';
import 'Routes.dart';



void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes ,
      initialRoute: '/' ,
      // home: Home(),

    );
  }
}


class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("xiechengDemo"),
      ),

      body: Center(
        child: Text("demo -- ++ "),
      ),
    );
  }
}


