
import 'dart:convert';

import 'package:aaaaa/interface/Login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';






class ImageState extends StatefulWidget {
  @override
  _ImageStateState createState() => _ImageStateState();
}


  Future<File> imageFiles;

class _ImageStateState extends State<ImageState> {
  ItemServices _itemServices;
  Item2 _item2;
  pickImageFromGallery(ImageSource source){
    setState(() {
      imageFiles = ImagePicker.pickImage(source: source);
    });
    

  }



  Widget showImage(){
    return FutureBuilder<File>(
      future:  imageFiles,
      builder: (BuildContext context,AsyncSnapshot<File> snapshot){
          if(snapshot.connectionState== ConnectionState.done &&
          snapshot.data!= null){
            return Image.file(
              snapshot.data,
              width: 300,
              height: 300,
            );
          }
          else if (snapshot.error != null) {
              return const Text(
                "Hata Var",
                textAlign: TextAlign.center,
              );
              
            
          }
          else   {
              return const Text(
                "Fotograf Seçilmedi",
                textAlign: TextAlign.center,
              );
              
            
          }
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("İmage"),),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showImage(),
            RaisedButton(
              child:Text("Galeriden Fotoğraf Yükleyin") ,
              onPressed: (){
                pickImageFromGallery(ImageSource.gallery);
                  
                  
                  
               
                
              },
              )
          ],
        )
       ,),
      
    );
  }
}