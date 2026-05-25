import 'package:flutter/material.dart';
import 'package:hrx_app/features/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Performix HRX',
      theme: ThemeData(

      colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),ome: SplashScreen(),
    );
  }
}


