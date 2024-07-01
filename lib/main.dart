import 'package:apinew/apiproject.dart';
import 'package:apinew/post/postapi.dart';
import 'package:apinew/products/productapi.dart';
import 'package:apinew/zippo/zippoapi.dart';
import 'package:flutter/material.dart';
import 'IPify/IPify.dart';
import 'IPinfo/ipinfo.dart';
import 'agify/agify.dart';
import 'bored/bored.dart';
import 'cart/dart1.dart';
import 'cart/dart2.dart';
import 'coindesk/coindeskapi.dart';
import 'dogs/dogs.dart';
import 'genderzie/genderize.dart';
import 'getID product/productapi.dart';
import 'getID product/singleproduct.dart';
import 'getlist/getlistapi.dart';
import 'jokesapi/jokes.dart';
import 'newapi/newpostapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:api(                        )
    );
  }
}
