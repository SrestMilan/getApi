import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api/Model/photos.dart';
import 'package:get_api/Model/usermodel.dart';
import 'package:get_api/Model/usersmodel.dart';
import 'package:get_api/Screen.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MaterialApp(home: Screen(),));
}




/*
class App extends StatelessWidget {
 
 
/*
  List<ListUser> userModel=[];
  Future<List<ListUser>> getData() async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
     for (Map i in data){
      userModel.add(ListUser.fromJson(i));
     }
     return userModel;

    }
    else{
      return userModel;
    }

  }
  
  */

  /* 2nd ways to get data

  List<Photo> photoData=[];
  Future<List<Photo>> getPhotoData()  async{
    final response= await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        Photo photo=Photo(title: i['title'], url: i['url']);
        photoData.add(photo);
      }
      return photoData;
    }
    else{
      return photoData;
    }
  }
*/
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
                return Text(userModel[index].website.toString());
        
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
*/