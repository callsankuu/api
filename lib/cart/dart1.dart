import 'dart:convert';
import 'package:apinew/cart/dart2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'modalcart.dart';

class dartapi extends StatefulWidget {
  const dartapi({super.key});

  @override
  State<dartapi> createState() => _dartapiState();
}

class _dartapiState extends State<dartapi> {
  Future<List<Cart>> hai() async{
    var result=await http.get(Uri.parse("https://fakestoreapi.com/carts"));
    var data = jsonDecode(result.body);
    return (data as List).map((e) => Cart.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: hai(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  List<Cart> list = snapshot.data!;
                  return Container(
                    height: 800,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap:(){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>getby(id: list[index].id!)));
                            });
                          },
                          child: ListTile(
                            leading: Container(height: 100, width: 100),
                            title: Column(
                              children: [
                                Text(list[index].id!.toString()),
                                Text(list[index].date!.toString()),
                                Text(list[index].userId!.toString()),
                                ...list[index].products!.map((product) =>Text('Product Id: ${product.productId}, Quantity: ${product.quantity}')),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("error");
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
