import 'package:flutter/material.dart';
import 'screens/bms_screen_improved.dart';

void main() {
  runApp(const BmsApp());
}

class BmsApp extends StatelessWidget {
  const BmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMS Gaming Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF94EA01)),
        useMaterial3: true,
        primaryColor: const Color(0xFF94EA01),
      ),
      debugShowCheckedModeBanner: false,
      home: const BmsScreenImproved(),
    );
  }
}