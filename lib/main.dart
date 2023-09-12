import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api/Model/usermodel.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(App(
    
    ));
}

class App extends StatelessWidget {
 
  List<User> userModel=[];
  Future<List<User>> getData() async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
     for (Map i in data){
      userModel.add(User.fromJson(i));
     }
     return userModel;

    }
    else{
      return userModel;
    }

  }

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
         title: Text('Hello'),
        ),
        body: Column(
      children: [
        Expanded(
          child: FutureBuilder(future: getData(), builder: (context,snapshot){
            if(!snapshot.hasData){
              return Text('loading');
            }
            else{
              return ListView.builder(
                itemCount: userModel.length,
                itemBuilder: (context,index){
                return Text(userModel[index].title.toString());
        
              });
            }
        
          }),
        )
      ],
    ),

      ),
    
    
    );
  }
}
