import 'package:flutter/material.dart';
import 'package:mbakurir/common/dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

var _username = ["username"];
var _password = ["password123"];
var datas = DummyData.data;

class Authentication {

  bool fetchCredentials(String username, String password) {
    for(var data in datas){
      if(data['username'] == username && data['password'] == password){
        saveUserData(data);
        return true;
      }
    }
    return false;
  }

  static void saveUserData(data) async {
    print(data['nama']);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("id", data['id']);
    await prefs.setString("nama", data['nama']);
    await prefs.setString("Nim", data['Nim']);
    await prefs.setString("username", data['username']);
    await prefs.setString("password", data['password']);
  }

  static Future<Map<String, dynamic>> getUserData() async{
    final prefs = await SharedPreferences.getInstance();
    return <String, dynamic>{
      "id": prefs.getInt('id'),
      "nama": prefs.getString('nama'),
      "Nim": prefs.getString('Nim'),
      "username": prefs.getString('username'),
      "password": prefs.getString('password'),
    };
  }
}