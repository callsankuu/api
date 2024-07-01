import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'modal.dart';

class Gen extends StatefulWidget {
  const Gen({super.key});

  @override
  State<Gen> createState() => _GenState();
}
class _GenState extends State<Gen> {
  
  Future<Genderize> sankar() async{
    var result = await http.get(Uri.parse("https://api.genderize.io?name=luc"));
        return Genderize .fromJson(jsonDecode(result.body));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(future:sankar() ,
                builder: (BuildContext Context,snapshot){
              if (snapshot.hasData){
                return Column(
                  children: [
                    Text(snapshot.data!.name.toString()),
                    Text(snapshot.data!.count.toString()),
                    Text(snapshot.data!.gender.toString()),
                    Text(snapshot.data!.probability.toString()),
                  ],
                );
              } else if (snapshot.hasError){
                return Text("${snapshot.error}");
              } return CircularProgressIndicator();
                }
                ),
          ],
        ),
      ),
    );
  }
}
