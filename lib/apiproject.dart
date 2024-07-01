import 'package:flutter/material.dart';
class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API Project ",style: TextStyle(
          color: Colors.blueAccent,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 500,width: 400,
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    height:400,width: 300,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

