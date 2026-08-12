import 'package:flutter/material.dart';
import 'package:peluditos/config/config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Peluditos'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
