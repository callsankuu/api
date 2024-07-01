import 'dart:convert';

import 'package:apinew/cart/modalcart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class getby extends StatefulWidget {
  final int id;
  const getby({super.key, required this.id});

  @override
  State<getby> createState() => _getbyState();
}

class _getbyState extends State<getby> {
  Future<Cart> fetch()async{
    final int id= widget.id;
    var result= await http.get(Uri.parse("https://fakestoreapi.com/carts/$id"));
    return Cart.fromJson(jsonDecode(result.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(future: fetch(),
              builder: (BuildContext context,snapshot){
            if (snapshot.hasData){
              return Column(
                children: [
                  Text(snapshot.data!.userId!.toString()),
                  Text(snapshot.data!.iV!.toString()),
                  Text(snapshot.data!.id!.toString()),
                  Text(snapshot.data!.products!.toString()),
                ],
              );
            }else if (snapshot.hasError){
              return Text("error");
            }return CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
