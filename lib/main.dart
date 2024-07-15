import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xFF0D101F)),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0xFF0D101F),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    );
  }
}



