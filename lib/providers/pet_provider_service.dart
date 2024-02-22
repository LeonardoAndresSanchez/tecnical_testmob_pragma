// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:tecnical_testmob_pragma/abstract/pet_service_abs.dart';
import 'package:tecnical_testmob_pragma/models/pet_img.dart';
import 'package:tecnical_testmob_pragma/models/pets.dart';

enum PetState { idle, busy }

class PetProvider extends ChangeNotifier {
  PetProvider({required PetServiceAbs service}) : _service = service {
    _state = PetState.busy;
    _listPets = [];
  }

  /// Attributes
  final PetServiceAbs _service;
  PetState? _state;
  List<Pet>? _listPets = [];
  List<PetImg>? _listPetsImg;
  int lastItem = 0;
  List<Pet>? petsResult = [];
  List<Pet>? petsAux = [];

  Future getpets() async {
    try {
      _listPets = await _service.fetchAllPets();
      petsAux = _listPets;
      notifyListeners();
      return _listPets;
    } catch (e) {
      print(e);
    } finally {}
  }

  void filterSearchResults(String query) {
    petsResult = petsAux!
        .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (query.isEmpty) {
      getPets;
    } else {
      _listPets = petsResult;
    }
    notifyListeners();
  }

  /// getters
  PetState? get state => _state;
  List<Pet>? get getPets => _listPets;
  List<PetImg>? get getPetsImg => _listPetsImg;

  /// setters
  set state(PetState? value) {
    _state = value;
    notifyListeners();
  }

  set setPets(List<Pet>? value) {
    _listPets = value!;
    notifyListeners();
  }

  set setPetsImg(List<PetImg>? value) {
    _listPetsImg = value!;
    notifyListeners();
  }
}
