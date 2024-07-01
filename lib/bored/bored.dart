import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'modal.dart';

class bore extends StatefulWidget {
  const bore({super.key});

  @override
  State<bore> createState() => _boreState();
}

class _boreState extends State<bore> {

  Future<Bored>  sankar() async {
    var result = await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
    return Bored.fromJson(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: sankar(),
              builder: (BuildContext Context ,snapshot) {
                if (snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.accessibility.toString()),
                      Text(snapshot.data!.activity.toString()),
                      Text(snapshot.data!.key.toString()),
                      Text(snapshot.data!.link.toString()),
                      Text(snapshot.data!.price.toString()),
                      Text(snapshot.data!.participants.toString()),
                      Text(snapshot.data!.type.toString()),
                    ],
                  );
                } else if (snapshot.hasError){
                  return Text("${snapshot.error}");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}
