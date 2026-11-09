
# Korisnici - Flutter aplikacija

Aplikacija prikazuje popis korisnika dohvaćenih s interneta.
Klikom na korisnika otvara se ekran s njegovim detaljima.

## Izvor podataka
https://jsonplaceholder.typicode.com/users

## Funkcionalnosti
- Dva ekrana povezana Navigatorom
- Dohvat podataka pomoću async/await
- FutureBuilder za učitavanje i pogreške
- ListView.builder za popis
- Model Korisnik s fromJson konstruktorom

## Animacije
- Hero animacija između ekrana
  - korisnik_kartica.dart
  - detalji_ekran.dart
- AnimatedSize za dodatne podatke
  - detalji_ekran.dart

## Geste
- Povlačenje prema dolje za osvježavanje
  - popis_ekran.dart

## Resursi
Nema AnimationControllera ni pretplata koje
je potrebno oslobađati u dispose.

## Pokretanje
1. flutter pub get
2. flutter run

## Provjera
flutter analyze
