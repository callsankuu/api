import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../getlist/getlistmodal.dart';
import 'modal.dart';

class zippo extends StatefulWidget {
  const zippo({super.key});

  @override
  State<zippo> createState() => _zippoState();
}

class _zippoState extends State<zippo> {

  // Future<List<Places>> alt() async{
  //   var result= await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
  //   var data = jsonDecode(result.body)["places"];
  //   return (data as List).map((obj) => Places.fromJson(obj)).toList();
  // }
  
  Future< Zippopotam> fetch()async{
    var result=await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
    return Zippopotam.fromJson(jsonDecode(result.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              FutureBuilder(future: fetch(),
                  builder: (BuildContext context,snapshot){
                if (snapshot.hasData){
                  return Column(
                    children: [
                    Text(snapshot.data!.country.toString()),
                    Text(snapshot.data!.countryAbbreviation.toString()),
                    Text(snapshot.data!.postCode.toString()),
                    // Text(snapshot.data!.country.toString()),
                    ],
                  );
                }else if (snapshot.hasError){
                  return Text("error");
                } return CircularProgressIndicator();
                  }),
            ],
          ),
      ),
    );
  }
}
