import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modal.dart';

class ip extends StatefulWidget {
  const ip({super.key});

  @override
  State<ip> createState() => _ipState();
}

class _ipState extends State<ip> {
  Future<Ipinfo>hai()async{
    var result = await http.get(Uri.parse("https://ipinfo.io/161.185.160.93/geo"));
    return Ipinfo.fromJson(jsonDecode(result.body));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(future: hai(),
                builder: (BuildContext context,snapshot){
              if (snapshot.hasData){
                return Column(
                  children: [
                    Container(
                      height: 200,width:200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(snapshot.data!.readme!)),
                      ),
                    ),
                    Text("${snapshot.data!.ip.toString()}"),
                    Text("${snapshot.data!.city.toString()}"),
                    Text("${snapshot.data!.region.toString()}"),
                    Text("${snapshot.data!.country.toString()}"),
                    Text("${snapshot.data!.loc.toString()}"),
                    Text("${snapshot.data!.postal.toString()}"),
                    Text("${snapshot.data!.timezone.toString()}"),
                  ],
                );
              }else if (snapshot.hasError){
                return Text("${snapshot.error}");
              }return CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}
