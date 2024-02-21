import 'package:flutter/material.dart';
import 'package:tecnical_testmob_pragma/abstract/pet_service_abs.dart';
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
  List<Pet>? _listPets;
  int lastItem = 0;

  Future getCollege() async {
    try {
      _listPets = await _service.fetchAllPets();
      notifyListeners();
      return _listPets;
    } catch (e) {
      print(e);
    } finally {}
  }

  add20Img() {
    for (var i = 0; i < 20; i++) {
      lastItem++;
    }
  }

  /// getters
  PetState? get state => _state;
  List<Pet>? get getPets => _listPets;

  /// setters
  set state(PetState? value) {
    _state = value;
    notifyListeners();
  }

  set setPets(List<Pet>? value) {
    _listPets = value!;
    notifyListeners();
  }
}
