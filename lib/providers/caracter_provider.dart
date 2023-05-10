import 'package:flutter/material.dart';
import 'package:challengebessiha/data/models/marvel_model.dart';
import 'package:challengebessiha/services/api_services.dart';

class CharacterProvider extends ChangeNotifier {
  List<CharacterModel> characters = [];
  bool isloading = false;
  List<CharacterModel> get getcharacter => characters;
  int limit = 10;
  int get getlimitr => limit;

  void changelimit() {
    limit = limit + 10;
    notifyListeners();
  }

  Future<void> getCharacters() async {
    isloading = true;
    notifyListeners();
    characters = (await ApiServices.getcharacter(limit: limit))!;
    isloading = false;
    notifyListeners();
  }
}
