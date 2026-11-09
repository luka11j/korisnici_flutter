
class Korisnik {
  final int id;
  final String ime;
  final String korisnickoIme;
  final String email;
  final String telefon;
  final String web;
  final String grad;
  final String ulica;
  final String tvrtka;

  const Korisnik({
    required this.id,
    required this.ime,
    required this.korisnickoIme,
    required this.email,
    required this.telefon,
    required this.web,
    required this.grad,
    required this.ulica,
    required this.tvrtka,
  });

  factory Korisnik.fromJson(Map<String, dynamic> json) {
    return Korisnik(
      id: json['id'],
      ime: json['name'],
      korisnickoIme: json['username'],
      email: json['email'],
      telefon: json['phone'],
      web: json['website'],
      grad: json['address']['city'],
      ulica: json['address']['street'],
      tvrtka: json['company']['name'],
    );
  }
}
