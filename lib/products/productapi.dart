import 'dart:convert';
import 'package:apinew/products/getsingle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'modal.dart';

class getallproducts extends StatefulWidget {
  const getallproducts({super.key});

  @override
  State<getallproducts> createState() => _getallproductsState();
}

class _getallproductsState extends State<getallproducts> {

  Future<List<Products>> fetch() async {
    var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(res.body);
    return (data as List).map((e) => Products.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: fetch(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  List<Products> list = snapshot.data!;
                  return Container(
                    height: 800,
                    child: ListView.builder(
                      itemCount: list.length,
                        itemBuilder: (context, int index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => getsinglepro(id: list[index].id!)));
                            });
                          },
                          child: ListTile(
                            leading: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(list[index].image!),
                                  fit: BoxFit.fill
                                )
                              ),
                            ),
                            title: Column(
                              children: [
                                Text(list[index].id!.toString()),
                                Text(list[index].title!.toString()),
                                Text(list[index].description!.toString()),
                                Text(list[index].category!.toString()),
                                Text(list[index].price!.toString()),
                                Text(list[index].rating!.rate.toString()),
                                Text(list[index].rating!.count.toString()),
                              ],
                            ),
                          ),
                        );
                        }
                    ),
                  );
                }else if (snapshot.hasError){
                    return Text("error");
              }return CircularProgressIndicator();
              }
          ),
        ],
      ),
    );
  }
}
