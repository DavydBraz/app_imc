import 'package:calculadoradeimcsimples/pages/homepage.dart';
import 'package:flutter/material.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.indigo,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
