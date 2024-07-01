import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class newpost extends StatefulWidget {
  const newpost({super.key});

  @override
  State<newpost> createState() => _newpostState();
}

class _newpostState extends State<newpost> {

  TextEditingController id = TextEditingController();
  TextEditingController des = TextEditingController();

  Future<bool>? _success;

  Future<bool> adpost(String catId, String desc) async {
    var result = await http.post(
        Uri.parse(
            "http://catodotest.elevadosoftwares.com/Allocation/InsertAllocation"),
        headers: <String, String>{
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          "allocationId": 0,
          "clientId": 1,
          "categoryId": 1,
          "employeeId": 1,
          "description": desc,
          "scheduledDate": "2023-03-17",
          "dueDate": "2023-03-19",
          "status": "Yet To Start",
          "startedDate": "",
          "completedDate": "",
          "uploadsPath": "",
          "createdBy": 1
        })
    );
    return jsonDecode(result.body)["success"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: (_success == null ? buildColumn() : buildFuturebuilder()),
          ),
        ],
      ),
    );
  }
  Column buildColumn() {
    return Column(
      children: [
        TextFormField(
          controller: id,
          decoration: InputDecoration(
            label: Text("id"),
          ),
        ),
        TextFormField(
          controller: des,
          decoration: InputDecoration(
            label: Text("description"),
          ),
        ), ElevatedButton(onPressed: () {
                 setState(() {
                   _success = adpost(id.text,des.text);
                 });
          },
            child:Text("save")),
      ],
    );
  }
  FutureBuilder buildFuturebuilder(){
    return FutureBuilder(
        future: _success,
        builder: (BuildContext context,snapshot){
      if(snapshot.hasData){
        return Text("added sucessfully");
      }
      else if(snapshot.hasError){
        return Text("${snapshot.error}");
      }return CircularProgressIndicator();
        });
  }
}
