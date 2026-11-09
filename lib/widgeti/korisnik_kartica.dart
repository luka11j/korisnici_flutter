
import 'package:flutter/material.dart';
import '../modeli/korisnik.dart';

class KorisnikKartica extends StatelessWidget {
  final Korisnik korisnik;
  final VoidCallback onTap;

  const KorisnikKartica({
    super.key,
    required this.korisnik,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: ListTile(
        leading: Hero(
          tag: 'korisnik-${korisnik.id}',
          child: CircleAvatar(
            child: Text(korisnik.ime[0]),
          ),
        ),
        title: Text(
          korisnik.ime,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(korisnik.email),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
