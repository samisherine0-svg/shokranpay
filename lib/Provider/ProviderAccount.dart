import 'package:flutter/material.dart';

class ProviderAccount with ChangeNotifier {
  List<String>? listPhotos;
  int? villageID;

  List<String>? get getPhotos => listPhotos;

  void setPhotos(List<String> list) {
    listPhotos = list;
    notifyListeners();
  }

  int? get getVillageID => villageID;

  void setVillageID(int id) {
    villageID = id;
    notifyListeners();
  }
}
