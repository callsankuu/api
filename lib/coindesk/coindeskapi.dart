import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'modal.dart';
class coindeskapi extends StatefulWidget {
  const coindeskapi({super.key});

  @override
  State<coindeskapi> createState() => _coindeskapiState();
}

class _coindeskapiState extends State<coindeskapi> {
  Future<Desk> fetch() async{
    var result = await http.get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
    return Desk.fromJson(jsonDecode(result.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(future:fetch() ,
              builder: (BuildContext Context,snapshot){
            if (snapshot.hasData){
              return Column(
                children: [
                  Text(snapshot.data!.bpi!.eUR!.description.toString()),
                  Text(snapshot.data!.bpi!.gBP!.description.toString()),
                  Text(snapshot.data!.bpi!.uSD!.description.toString()),
                  Text(snapshot.data!.chartName.toString()),
                  Text(snapshot.data!.disclaimer.toString()),
                  Text(snapshot.data!.time!.updated.toString()),
                 // Text(snapshot.data!.bpi.toString()),
                ],
              );
            } else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }  return CircularProgressIndicator();
              }),
        ],
      )
    );
  }
}
