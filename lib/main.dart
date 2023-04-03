import 'package:flutter/material.dart';
import 'package:manui/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  //initialize hive 
  await Hive.initFlutter();

  //open the box
  // ignore: unused_local_variable
  var box= await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
