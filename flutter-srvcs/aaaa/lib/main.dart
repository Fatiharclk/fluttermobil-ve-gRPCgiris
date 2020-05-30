
import 'package:aaaaa/interface/ImageState.dart';
import 'package:aaaaa/interface/Login.dart';
import 'package:aaaaa/interface/appBar.dart';
import 'package:aaaaa/interface/basitharita.dart';
import 'package:aaaaa/interface/basithttp.dart';

import 'package:aaaaa/interface/deneme.dart';
import 'package:aaaaa/interface/googlemap.dart';

import 'package:flutter/material.dart';

void main(){

runApp(

News()

);
}


class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:"/" ,
      routes: {
        "/Menü":(context) => AramaAppBar(),
        "/MapSample" : (context) => MapSample(),
        "/Http" : (context) =>BasitHttp(),
        "/My" : (context) => MyApp(),
       "/" : (context) =>Login(),
       "/Image":(context) => ImageState(),
       "/Bharita":(context) => HaritaBasit(),
       
       
        
        
        

      },
    );
  }
}