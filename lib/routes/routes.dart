import 'package:flutter/material.dart';
import 'package:tecnical_testmob_pragma/pages/detail_pet.dart';
import 'package:tecnical_testmob_pragma/pages/home/home.dart';
import 'package:tecnical_testmob_pragma/pages/splash.dart';

final Map<String, Widget Function(BuildContext)> appRoute = {
  'home': (_) => const HomePage(),
  'detail': (_) => const DetailPage(),
  'splash': (_) => const SplashPage(),
};
