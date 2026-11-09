
import 'package:flutter/material.dart';
import '../modeli/korisnik.dart';
import '../usluge/korisnik_usluga.dart';
import '../widgeti/korisnik_kartica.dart';
import 'detalji_ekran.dart';

class PopisEkran extends StatefulWidget {
  const PopisEkran({super.key});

  @override
  State<PopisEkran> createState() => _PopisEkranState();
}

class _PopisEkranState extends State<PopisEkran> {
  final KorisnikUsluga usluga = KorisnikUsluga();
  late Future<List<Korisnik>> korisnici;

  @override
  void initState() {
    super.initState();
    korisnici = usluga.dohvatiKorisnike();
  }

  Future<void> osvjezi() async {
    final noviPodaci = usluga.dohvatiKorisnike();

    setState(() {
      korisnici = noviPodaci;
    });

    try {
      await noviPodaci;
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Popis je osvježen!'),
        ),
      );
    } catch (_) {
      // FutureBuilder prikazuje pogrešku.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popis korisnika'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: osvjezi,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Korisnik>>(
        future: korisnici,
        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Greška! Provjeri internet vezu.',
                  ),
                  ElevatedButton(
                    onPressed: osvjezi,
                    child: const Text('Pokušaj ponovno'),
                  ),
                ],
              ),
            );
          }

          final lista = snapshot.data ?? [];

          if (lista.isEmpty) {
            return const Center(
              child: Text('Nema korisnika.'),
            );
          }

          return RefreshIndicator(
            onRefresh: osvjezi,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final korisnik = lista[index];

                return KorisnikKartica(
                  korisnik: korisnik,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetaljiEkran(korisnik: korisnik),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
