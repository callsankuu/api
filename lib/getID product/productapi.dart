import 'dart:convert';
import 'package:apinew/getID%20product/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'modal.dart';

class pro extends StatefulWidget {
  const pro({super.key});

  @override
  State<pro> createState() => _proState();
}

class _proState extends State<pro> {
  Future<List<Product>> fetch() async{
    var result= await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(result.body);
     return(data as List).map((e) => Product.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(future: fetch(),
              builder: (BuildContext context,snapshot){
            if(snapshot.hasData){
              List<Product> list=snapshot.data!;
              return  Container(
                height: 800,
                child: ListView.builder(
                  itemCount: list.length,
                    itemBuilder: (Context,int index){
                 return GestureDetector(
                   onTap: (){
                     setState(() {
                       Navigator.push(context, MaterialPageRoute(
                           builder: (context) => pro2(id: list[index].id!)));
                     });
                   },
                   child: ListTile(
                     leading: Container(
                       height: 200,width: 200,
                       decoration: BoxDecoration(
                         image: DecorationImage(
                             image: NetworkImage(list[index].image!),
                           fit: BoxFit.fill
                         ),
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
                    }),
              );
            }else if(snapshot.hasError){
              return Text("error");
            }return CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
