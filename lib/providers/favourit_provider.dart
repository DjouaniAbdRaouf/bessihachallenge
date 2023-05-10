// ignore_for_file: unused_element, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:challengebessiha/data/models/marvel_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritProvider extends ChangeNotifier {
  List<CharacterModel> myfavourites = [];
  List<CharacterModel> get getFavourit => myfavourites;
  late SharedPreferences sharedPreferences;

  void initalizSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> getfavourite() async {
    myfavourites.clear();
    if (sharedPreferences.getString('favourite') != null) {
      String stringfavourite = sharedPreferences.getString('favourite')!;
      List favouriteListString = jsonDecode(stringfavourite);
      for (var i = 0; i < favouriteListString.length; i++) {
        myfavourites.add(CharacterModel.fromJson(favouriteListString[i]));
      }
      notifyListeners();
    }
  }

  void clearFavourite() async {
    await sharedPreferences.remove("favourite");
  }

  bool characterExiste({required CharacterModel characterModel}) {
    var results =
        myfavourites.indexWhere((element) => element.id == characterModel.id);
    if (results == -1) {
      return false;
    } else {
      return true;
    }
  }

  void addCharacter({required CharacterModel characterModel}) async {
    myfavourites.add(characterModel);
    await saveFavourite();
  }

  Future<void> saveFavourite() async {
    List items = myfavourites.map((e) => e.toJson()).toList();
    sharedPreferences.setString('favourite', jsonEncode(items));
    await getfavourite();
  }
}
