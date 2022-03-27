import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_ejemplos/examples/users_bloc_crud_api/models/userscrud.dart';
import 'package:flutter_bloc_ejemplos/examples/users_bloc_crud_api/services/responses.dart';
import 'package:http/http.dart' as http;

 class UsersCrudService {


  final String _url = 'https://www.mecallapi.com/api';
  final dio = Dio();
  List<Usercrud> users = [];

  // CRUD with HTPP

  Future<List<Usercrud>> getUsersHttp() async {

   try {

     final url = Uri.parse('$_url/users');
     final response = await http.get(url);
     List<Usercrud> users = (json.decode(response.body) as List)
                                .map((e) => Usercrud.fromJson(jsonEncode(e)))
                                .toList();
     this.users = users;
     
     return [];
     
   } catch (err) {
    //  print(err);
     return [];
   }
  }

  Future postUsersHttp(Usercrud user) async {
   
   try {

     final url = Uri.parse('$_url/users/create');
     final response = await 
     http.post(url,
      headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
      }, 
      body: user.toJson()
     );
      final instancia = Responses.fromJson(response.body);

     if(response.statusCode == 200){
      
      users.add(instancia.user!);

     } else {
      //  print(instancia.status);
     }

   } catch (err) {
    //  print(err);
   }

  }

  Future putUsersHttp(Usercrud user) async {
   
   try {

     final url = Uri.parse('$_url/users/update');
     final response = await 
     http.put(url,
      headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
      }, 
      body: user.toJson()
     );
      Responses.fromJson(response.body);

     if(response.statusCode == 200){
      
      final index = users.indexWhere((i) => i.id == user.id);
      users[index] = user;
      
     } else {
      //  print(instancia.toString());
     }

   } catch (err) {
    //  print(err);
   }

  }

  Future deleteUsersHttp(Usercrud user) async {
   
   try {

     final url = Uri.parse('$_url/users/delete');
     final response = await 
     http.delete(url,
      headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
      }, 
      body: user.toJson()
     );
      Responses.fromJson(response.body);

     if(response.statusCode == 200){
      
      final index = users.indexWhere((i) => i.id == user.id);
      users.removeAt(index);
      
     } else {
      //  print(instancia.toString());
     }

   } catch (err) {
    //  print(err);
   }

  }

  //============================ ==============================

  
  // CRUD with DIO
  Future getUsersDio() async {
    
    try {

      final url = '$_url/users';
      final response = await dio.get(url);
      final resp = jsonEncode(response.data);
      List<Usercrud> users = (json.decode(resp) as List)
                                .map((e) => Usercrud.fromJson(jsonEncode(e)))
                                .toList();
      if(response.statusCode == 200){
        
        this.users = users;
        // print('se logro hacer la llamada');
        // print(users);
        return users;
        
      } else {
        // print('Devolvemos el array vacio');
        return [];
      }
     
    } catch (err) {
      // print(err);
      return [];
    }
  }

  Future postUsersDio(Usercrud user) async {
    
    try {

      final url = '$_url/users/create';
      final response = await dio.post(url, data: user.toJson());
      final resp = jsonEncode(response.data);
      // print(resp);
      final instancia = Responses.fromJson(resp);

      if(response.statusCode == 200){
        // users.add(instancia.user!);
        Usercrud newUser = instancia.user!;
        // print('Se realizo el post');
        return newUser;
        
      } else {
        // print(instancia.status);
        return null;
      }

      
    } catch (err) {
    
      // print(err);
    }
  }

  Future putUsersDio(Usercrud user) async {
    
    try {

      final url = '$_url/users/update';
      final response = await dio.put(url, data: user.toJson());
      // print(response.data);
      final resp = jsonEncode(response.data);
      Responses.fromJson(resp);

      if(response.statusCode == 200){
        // print('Update ok');
        
      } else {
        // print(instancia.status);
      }

      
    } catch (err) {
      // print(err);
    }
  }
  
  Future deleteUsersDio(Usercrud user) async {
    
    try {

      final url = '$_url/users/delete';
      final response = await dio.delete(url, data: user.toJson());
      final resp = jsonEncode(response.data);
      Responses.fromJson(resp);

      if(response.statusCode == 200){
    
        // print('correcto');
      } else {
        // print(instancia.status);
      }

      
    } catch (err) {
      // print(err);
    }
  }


 }