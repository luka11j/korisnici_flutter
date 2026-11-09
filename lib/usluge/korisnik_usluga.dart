
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modeli/korisnik.dart';

class KorisnikUsluga {
  Future<List<Korisnik>> dohvatiKorisnike() async {
    final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/users',
    );

    final odgovor = await http.get(url);

    if (odgovor.statusCode == 200) {
      final List podaci = jsonDecode(odgovor.body);

      return podaci
          .map((podatak) => Korisnik.fromJson(podatak))
          .toList();
    } else {
      throw Exception('Greška pri dohvaćanju korisnika');
    }
  }
}
