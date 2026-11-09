
import 'package:flutter/material.dart';
import '../modeli/korisnik.dart';

class DetaljiEkran extends StatefulWidget {
  final Korisnik korisnik;

  const DetaljiEkran({
    super.key,
    required this.korisnik,
  });

  @override
  State<DetaljiEkran> createState() => _DetaljiEkranState();
}

class _DetaljiEkranState extends State<DetaljiEkran> {
  bool prikaziDodatno = false;

  @override
  Widget build(BuildContext context) {
    final korisnik = widget.korisnik;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalji korisnika'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),

          Center(
            child: Hero(
              tag: 'korisnik-${korisnik.id}',
              child: CircleAvatar(
                radius: 45,
                child: Text(
                  korisnik.ime[0],
                  style: const TextStyle(fontSize: 35),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            korisnik.ime,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            '@${korisnik.korisnickoIme}',
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text('Email'),
                  subtitle: Text(korisnik.email),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Telefon'),
                  subtitle: Text(korisnik.telefon),
                ),
                ListTile(
                  leading: const Icon(Icons.location_city),
                  title: const Text('Grad'),
                  subtitle: Text(korisnik.grad),
                ),
                ListTile(
                  leading: const Icon(Icons.business),
                  title: const Text('Tvrtka'),
                  subtitle: Text(korisnik.tvrtka),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () {
              setState(() {
                prikaziDodatno = !prikaziDodatno;
              });
            },
            child: Text(
              prikaziDodatno
                  ? 'Sakrij dodatno'
                  : 'Prikaži dodatno',
            ),
          ),

          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            child: prikaziDodatno
                ? Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.home),
                          title: const Text('Ulica'),
                          subtitle: Text(korisnik.ulica),
                        ),
                        ListTile(
                          leading: const Icon(Icons.language),
                          title: const Text('Web stranica'),
                          subtitle: Text(korisnik.web),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(width: double.infinity),
          ),
        ],
      ),
    );
  }
}
