import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'jokemodal.dart';

class joke extends StatefulWidget {
  const joke({super.key});

  @override
  State<joke> createState() => _jokeState();
}

class _jokeState extends State<joke> {
  Future<Jokes> smile() async{
    var result =await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    return Jokes.fromJson(jsonDecode(result.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              FutureBuilder(future: smile(),
                  builder: (BuildContext context,snapshot){
                if (snapshot.hasData){
                  return Column(
                    children: [
                      Text("${snapshot.data!.id.toString()}"),
                      Text("${snapshot.data!.setup.toString()}"),
                      Text("${snapshot.data!.type.toString()}"),
                      Text("${snapshot.data!.punchline.toString()}"),
                    ],
                  );
                } else if (snapshot.hasError){
                  return Text("${snapshot.error}");
                }return CircularProgressIndicator();
                  }),
            ],
          ),
      ),
    );
  }
}
