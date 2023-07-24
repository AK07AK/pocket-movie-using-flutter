import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/splash_page.dart';

import 'package:riverpod/riverpod.dart';

import '../pages/main_page.dart';
void main() {
  runApp(SplashPage(key: UniqueKey(), onInitializationComplete: () {
    runApp(const ProviderScope(child: MyApp()));
  } ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pocket Movie.',
      initialRoute: 'home' ,
      routes: {
        'home':(BuildContext context) => MainPage(),
      },
      theme: ThemeData(primarySwatch: Colors.blue,visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}




