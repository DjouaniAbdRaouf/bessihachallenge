// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:challengebessiha/core/constants/app_strings.dart';
import 'package:challengebessiha/data/models/comics_model.dart';
import 'package:challengebessiha/data/models/marvel_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<CharacterModel>?> getcharacter(
      {required int limit}) async {
    List<CharacterModel> mycharacters = [];
    try {
      String url =
          "${StringsApp.endpointCaracters}?ts=${StringsApp.timetimp}&apikey=${StringsApp.apikey}&hash=${StringsApp.hash}&limit=$limit";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var results = data["data"]["results"];
        for (var element in results) {
          CharacterModel charachter = CharacterModel.fromJson(element);
          mycharacters.add(charachter);
        }
        return mycharacters;
      } else {
        debugPrint("erroe when getting response");
      }
    } catch (e) {
      debugPrint("error when getting data from api $e");
    }
    return null;
  }

  static Future<List<String>> getMyComics({required String urlEndpoint}) async {
    List<String> mycomics = [];
    try {
      String url =
          "$urlEndpoint?ts=${StringsApp.timetimp}&apikey=${StringsApp.apikey}&hash=${StringsApp.hash}";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        print(uri);
        var data = jsonDecode(response.body);
        var results = data["data"]["results"][0]["urls"];
        for (var element in results) {
          mycomics.add(element["url"]);
        }
        return mycomics;
      } else {
        debugPrint("erroe when getting response");
      }
    } catch (e) {
      debugPrint("error when getting data from api $e");
    }
    return [];
  }
}
