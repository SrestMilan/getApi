import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api/Model/photos.dart';
import 'package:get_api/Model/usermodel.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(App(
    
    ));
}





class App extends StatelessWidget {
 
  /*
  Example 1 for get api

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
          child: FutureBuilder(future: getPhotoData(), builder: (context,snapshot){
            if(!snapshot.hasData){
              return Text('loading');
            }
            else{
              return ListView.builder(
                itemCount: photoData.length,
                itemBuilder: (context,index){
                return Text(photoData[index].url.toString());
        
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
