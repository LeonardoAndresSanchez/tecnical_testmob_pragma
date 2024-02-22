import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_testmob_pragma/routes/routes.dart';

import 'providers_setup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'technical test mob',
        theme: ThemeData(
          fontFamily: 'Quicksand',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff42ca7e)),
          useMaterial3: true,
        ),
        initialRoute: 'splash',
        routes: appRoute,
      ),
    );
  }
}
