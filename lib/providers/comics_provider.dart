// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:challengebessiha/data/models/comics_model.dart';
import 'package:challengebessiha/services/api_services.dart';

class ComicsProvider extends ChangeNotifier {
  List<String> comics = [];
  bool isloading = false;
  List<String> get getcomics => comics;

  Future<void> getComics({required String urlEndpoints}) async {
    isloading = true;
    notifyListeners();
    comics = (await ApiServices.getMyComics(urlEndpoint: urlEndpoints));
    isloading = false;
    print(comics.length.toString() + "-----------------------");
    notifyListeners();
  }
}
