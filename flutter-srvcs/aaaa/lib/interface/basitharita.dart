import 'dart:async';
import 'package:aaaaa/interface/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; 
import 'package:http/http.dart' as http;


class HaritaBasit extends StatefulWidget {
  @override
  
  _HaritaBasitState createState() => _HaritaBasitState();
  
}



class _HaritaBasitState extends State<HaritaBasit> {

  
  




  ItemServices _itemServices;
   
  Item2 _item2;
  
  GoogleMapController _controller;
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(title : Text("GoogleMap")),
      body:GoogleMap(initialCameraPosition: 
          CameraPosition(
          target: LatLng(38.5002, 27.7084),
          zoom: 12.0,
          ),
             onMapCreated: (GoogleMapController controller){
        _controller=controller;
        },
          ) ,
    );
    
  }
}


