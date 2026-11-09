
import 'package:flutter/material.dart';
import 'ekrani/popis_ekran.dart';

void main() {
  runApp(const KorisniciApp());
}

class KorisniciApp extends StatelessWidget {
  const KorisniciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Korisnici',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const PopisEkran(),
    );
  }
}
