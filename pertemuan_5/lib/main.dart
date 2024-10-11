import 'package:flutter/material.dart';
import 'package:pertemuan_5/components/konten.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Konten(),
    );
  }
}

main.dart