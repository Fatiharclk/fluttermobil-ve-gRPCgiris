



import 'package:aaaaa/interface/appBar.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}



final formKey =GlobalKey<FormState>();
Item2 _item2;

Item2 item2FromJson(String str) => Item2.fromJson(json.decode(str));

String item2ToJson(Item2 data) => json.encode(data.toJson());
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ıtem Tarafı
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Item2 {
    String message;
    bool success;
    Data data;
    String username ;
    String password;

    Item2({
        this.message,
        this.success,
        this.data,
        this.password,
        this.username,
        
    });
    

    factory Item2.fromJson(Map<String, dynamic> json) => Item2(
        message: json["message"],
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

      String toJson(){
      var map =Map<String,dynamic>();
      map["username"]=username;
      map["password"]=password;
      return json.encode(map);
    }
}

class Data {
    Profile profile;
    Location location;

    Data({
        this.profile,
        this.location,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        profile: Profile.fromJson(json["profile"]),
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "profile": profile.toJson(),
        "location": location.toJson(),
    };
}

class Location {
    double lat;
    double lon;

    Location({
        this.lat,
        this.lon,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
    };
}

class Profile {
    String name;
    String surname;
    String city;

    Profile({
        this.name,
        this.surname,
        this.city,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"],
        surname: json["surname"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "city": city,
    };
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SERVİS TARAFI
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ItemServices{

String kname ;
bool succecsmesage ;
double latK;
double lonK;


  Future<Item2> bilgiGonder(String itemjson) async{
    final response = await http.post("http://yusufozgul.com:8282/login",
    headers: {'content-type':'aplication/json'},
    body:itemjson
    );
    if (response.statusCode==200) {
      
      var jsonResponse = await jsonDecode(response.body);

      print(jsonResponse);
      final Item2 = await item2FromJson(response.body);
      
      succecsmesage= await Item2.success;
      latK=Item2.data.location.lat;
      lonK=Item2.data.location.lon;
      kname = await Item2.username;
      return Item2;
      
      
      
      
    }
    else Exception("Somting wont wrong");
      
  }
  

}
var item;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Ekran tasarım tarafı
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class _LoginState extends State<Login> {
ItemServices _itemServices;


final formKey = GlobalKey<FormState>();
String username1,password1;

  @override
  void initState(){
    _itemServices=ItemServices();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      

      body: 
      Container(
        
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover
          )
        ),
        padding: EdgeInsets.fromLTRB(20, 130, 10,20),
        child :Form(
        autovalidate: true,
        key : formKey,
        child:Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        
          
        Text("MOBİL UYGULAMA PROJESİ",
        style: TextStyle(color: Colors.black,fontSize: 30),
        ),


        
        Container(
          child: Column(
            
            children: <Widget>[
              TextFormField(  
        
        decoration: InputDecoration(
        labelText: 'usernema'
        ),
        
        onSaved: (String) => username1=String,

      ),

        TextFormField(
        obscureText: true,
        decoration: InputDecoration(
        labelText: 'pasworrd'
      
        ),
        
        onSaved: (String) => password1=String,
  
      ),
      
        RaisedButton(
                  color: Colors.white,
                  child: 
                  Text("Giriş Yap"),
                onPressed: (){
                  
                  cevap();

        

                }
                ),



            ],),
        ),
        
        
                
            
         

      ],
      ),
      )
      )
    );
  }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Servisten cevap beklenen kısım ve login işlemi
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void cevap () async {
                   

                   this.formKey.currentState.save();
                  _item2;
                  
                 var item=  await Item2(username: username1,password: password1);
                   await _itemServices.bilgiGonder(item.toJson());
                    
                   bool hazir;
                   hazir= await _itemServices.succecsmesage;
                  if ( hazir == true )  {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AramaAppBar()));
                  print(_itemServices.latK);
                  print(_itemServices.lonK);
                  print(username1);
                  print(password1);
                  
                  
                  
                  

                  }
                  else{
                  print("Yanlış veya eksik bilgi girdiniz");
                  }
                     
                   
                   

                 }
  



 
  


}


// ()=> Navigator.pushNamed(context, "/Menü")
/* Post();
                  
                  this.formKey.currentState.save();
 if(username == "mobil" && password=="123456" ){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AramaAppBar()));


                  }
                  else
                  print("Olmadı yarrrr");*/