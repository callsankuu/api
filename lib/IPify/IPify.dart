import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'modal.dart';
class ipify extends StatefulWidget {
  const ipify({super.key});

  @override
  State<ipify> createState() => _ipifyState();
}

class _ipifyState extends State<ipify> {
Future<IPify> oye() async{
  var result= await http.get(Uri.parse("https://api.ipify.org?format=json"));
  return IPify.fromJson(jsonDecode(result.body));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
              FutureBuilder(future: oye(),
               builder: (BuildContext Context,snapshot){
                if (snapshot.hasData){
                 return Column(
                   children: [
                     Text(snapshot.data!.ip.toString())
                   ],
                 );
                }else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }return CircularProgressIndicator();
        }),
          ],
        ),
      ),
    );
  }
}
