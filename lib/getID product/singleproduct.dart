import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'modal.dart';

class pro2 extends StatefulWidget {
  final int id;
  const pro2({super.key,required this.id});

  @override
  State<pro2> createState() => _pro2State();
}

class _pro2State extends State<pro2> {
  Future<Product> sad() async{
    final int id = widget.id;
    var result = await http.get(Uri.parse("https://fakestoreapi.com/products/$id"));
    return Product.fromJson(jsonDecode(result.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(future:sad(),
              builder: (BuildContext context,snapshot){
            if (snapshot.hasData){
              return ListTile(
                leading: Container(
                  height: 200,width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:NetworkImage(snapshot.data!.image!),
                    fit: BoxFit.fill
                    ),
                  ),
                ),
                title: Column(
                  children: [
                    Text(snapshot.data!.id!.toString()),
                    Text(snapshot.data!.price!.toString()),
                    Text(snapshot.data!.category!.toString()),
                    Text(snapshot.data!.title!.toString()),
                    Text(snapshot.data!.description!.toString()),
                    Text(snapshot.data!.rating!.rate!.toString()),
                    Text(snapshot.data!.rating!.count!.toString()),
                  ],
                ),
              );
            } else if(snapshot.hasError){
              return Text("error");
            }return CircularProgressIndicator();
          }
          ),
        ],
      ),
    );
  }
}
