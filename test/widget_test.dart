import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // Ganti dengan nama package Anda

void main() {
  testWidgets('Dashboard loads all required components', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Soal 1: Produk
    expect(find.text('Laptop'), findsOneWidget);
    expect(find.text('Rp 15000000'), findsOneWidget);
    expect(find.byIcon(Icons.laptop), findsOneWidget);

    expect(find.text('Smartphone'), findsOneWidget);
    expect(find.text('Rp 8000000'), findsOneWidget);
    expect(find.byIcon(Icons.phone_android), findsOneWidget);

    expect(find.text('Headphone'), findsOneWidget);
    expect(find.text('Rp 1200000'), findsOneWidget);
    expect(find.byIcon(Icons.headphones), findsOneWidget);

    expect(find.text('Mouse'), findsOneWidget);
    expect(find.text('Rp 250000'), findsOneWidget);
    expect(find.byIcon(Icons.mouse), findsOneWidget);

    // Soal 2: Profil Mahasiswa
    expect(find.text('Budi Santoso'), findsOneWidget);
    expect(find.text('23.11.5321'), findsOneWidget);
    expect(find.text('Teknik Informatika'), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
    expect(find.byType(CircleAvatar), findsAtLeastNWidgets(1));

    // Soal 3: Daftar Kontak
    expect(find.text('Ani'), findsOneWidget);
    expect(find.text('0812-3456-7890'), findsOneWidget);
    expect(find.text('Online'), findsOneWidget);

    expect(find.text('Budi'), findsOneWidget);
    expect(find.text('0823-4567-8901'), findsOneWidget);
    expect(find.text('Offline'), findsOneWidget);

    expect(find.text('Cici'), findsOneWidget);
    expect(find.text('0834-5678-9012'), findsOneWidget);
    expect(find.text('Away'), findsOneWidget);

    expect(find.byIcon(Icons.call), findsNWidgets(3));

    // Soal 4: Struktur Layout
    expect(find.byType(Card), findsNWidgets(8)); // 4 produk + 1 mahasiswa + 3 kontak
    expect(find.byType(ListTile), findsNWidgets(3));
  });

  testWidgets('Tapping "Lihat Detail" shows snackbar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Lihat Detail'));
    await tester.pumpAndSettle();

    expect(find.text('Detail mahasiswa ditampilkan'), findsOneWidget);
  });

  testWidgets('Tapping call button shows dialog and snackbar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.call).first);
    await tester.pumpAndSettle();

    expect(find.text('Panggilan'), findsOneWidget);
    expect(find.text('Menelepon Ani?'), findsOneWidget);

    await tester.tap(find.text('Panggil'));
    await tester.pumpAndSettle();

    expect(find.text('Memanggil Ani...'), findsOneWidget);
  });
}