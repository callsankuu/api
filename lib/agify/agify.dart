import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'modal.dart';

class agi extends StatefulWidget {
  const agi({super.key});

  @override
  State<agi> createState() => _agiState();
}

class _agiState extends State<agi> {
  
  Future<Agify> siva() async {
    var result = await http.get(Uri.parse("https://api.agify.io?name=meelad"));
    return Agify.fromJson(jsonDecode(result.body));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
                future: siva(),
                builder: (BuildContext Context , snapshot){
                  if (snapshot.hasData){
                    return Column(
                      children: [
                        Text(snapshot.data!.age.toString()),
                        Text(snapshot.data!.name.toString()),
                        Text(snapshot.data!.count.toString()),
                      ],
                    );
                  } else if (snapshot.hasError){
                    return Text("${snapshot.error}");
                  } return CircularProgressIndicator();
                }

            )
          ],
        ),
      ),
    );
  }
}
