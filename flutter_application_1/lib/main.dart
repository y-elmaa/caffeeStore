import 'package:flutter/material.dart';

import 'package:flutter_application_1/homepage.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 116, 99, 100)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
