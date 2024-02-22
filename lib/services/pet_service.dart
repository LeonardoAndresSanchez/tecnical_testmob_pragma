import 'dart:convert';

import 'package:http/http.dart';
import 'package:tecnical_testmob_pragma/abstract/pet_service_abs.dart';

import 'package:tecnical_testmob_pragma/models/pets.dart';

class PetService implements PetServiceAbs {
  var headers = {'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'};
  @override
  Future fetchAllPets() async {
    final uri = Uri.parse('https://api.thecatapi.com/v1/breeds');
    Response response = await get(uri);
    List<dynamic> res = jsonDecode(utf8.decode(response.bodyBytes));

    return res.map((json) => Pet.fromJson(json)).toList();
  }
}
