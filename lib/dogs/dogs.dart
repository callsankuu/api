import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'dogs modal.dart';
class dogsapi extends StatefulWidget {
  const dogsapi({super.key});

  @override
  State<dogsapi> createState() => _dogsapiState();
}

class _dogsapiState extends State<dogsapi> {
  Future<Dogs> barks() async{
    var result= await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    return Dogs.fromJson(jsonDecode(result.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(future:barks(),
                builder: (BuildContext context,snapshot){
              if (snapshot.hasData){
                return Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(snapshot.data!.message!)),
                      ),
                    ),
                    Text(snapshot.data!.status.toString()),
                  ],
                );
              } else if(snapshot.hasError){
                return Text("${snapshot.error}");
              }return CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}
