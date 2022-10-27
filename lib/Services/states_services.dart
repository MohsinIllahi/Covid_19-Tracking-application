import 'dart:convert';

import 'package:covid_app/Models/WorldStatesModel.dart';
import 'package:covid_app/Services/Utilities/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class StatesServices{
  Future<WorldStatesModel> fetchWorldStatesRecord() async{
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }
  Future<List<dynamic>> countriesListApi() async{
    final response = await http.get(Uri.parse(AppUrl.countriesList));
var data;
    if(response.statusCode == 200){
       data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception('Error');
    }
  }
}