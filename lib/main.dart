import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() {
  runApp(const QaloonWarshApp());
}

class QaloonWarshApp extends StatelessWidget {
  const QaloonWarshApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: const MainScreen(
          // title: 'Flutter Demo Home Page'
      ),
    );
  }
}
