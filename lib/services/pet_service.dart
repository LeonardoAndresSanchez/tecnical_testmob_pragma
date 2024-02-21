import 'dart:convert';

import 'package:http/http.dart';
import 'package:tecnical_testmob_pragma/abstract/pet_service_abs.dart';
import 'package:tecnical_testmob_pragma/models/pets.dart';

class PetService implements PetServiceAbs {
  final uri = Uri.parse('https://api.thecatapi.com/v1/breeds');

  static String path = 'tyba-assets.s3.amazonaws.com';
  @override
  Future fetchAllPets() async {
    Response response = await get(uri);
    List<dynamic> res = jsonDecode(utf8.decode(response.bodyBytes));

    return res.map((json) => Pet.fromJson(json)).toList();
  }
}
