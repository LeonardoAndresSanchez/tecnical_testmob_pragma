import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tecnical_testmob_pragma/providers/pet_provider_service.dart';
import 'package:tecnical_testmob_pragma/services/pet_service.dart';

List<SingleChildWidget> providers = [
  // single providers
  Provider(create: (context) => PetService()),

  //
  ChangeNotifierProvider(
    create: (context) => PetProvider(service: PetService()),
  ),
];
