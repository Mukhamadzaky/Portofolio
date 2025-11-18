import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis Pertemuan 5 - Modern UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FE),
      ),
      home: const DashboardPage(),
    );
  }
}

// ───── MODEL ─────
class Product {
  final String name;
  final double price;
  final IconData icon;
  final Color color;

  Product({required this.name, required this.price, required this.icon, required this.color});
}

final List<Product> products = [
  Product(name: "Laptop", price: 15000000, icon: Icons.laptop, color: Colors.blue.shade600),
  Product(name: "Smartphone", price: 8000000, icon: Icons.phone_android, color: Colors.teal.shade600),
  Product(name: "Headphone", price: 1200000, icon: Icons.headphones, color: Colors.purple.shade600),
  Product(name: "Mouse", price: 250000, icon: Icons.mouse, color: Colors.orange.shade600),
  // Tambahkan item lain untuk testing scroll
  Product(name: "Keyboard", price: 750000, icon: Icons.keyboard, color: Colors.red.shade600),
  Product(name: "Monitor", price: 3500000, icon: Icons.desktop_windows, color: Colors.green.shade600),
  Product(name: "Webcam", price: 1200000, icon: Icons.videocam, color: Colors.pink.shade600),
  Product(name: "Speaker", price: 900000, icon: Icons.speaker, color: Colors.amber.shade600),
];

class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;

  const Mahasiswa({required this.nama, required this.nim, required this.prodi});
}

const mahasiswa = Mahasiswa(
  nama: "Mukhamad Zaky",
  nim: "231080200056",
  prodi: "Informatika",
);

class Kontak {
  final String nama;
  final String nomor;
  final String status;
  final Color statusColor;

  Kontak({required this.nama, required this.nomor, required this.status, required this.statusColor});
}

final List<Kontak> daftarKontak = [
  Kontak(nama: "Febri", nomor: "0812-3456-7890", status: "Online", statusColor: Colors.green),
  Kontak(nama: "Gavril", nomor: "0823-4567-8901", status: "Offline", statusColor: Colors.grey),
  Kontak(nama: "Bimas", nomor: "0834-5678-9012", status: "Away", statusColor: Colors.orange),
  Kontak(nama: "Bagas", nomor: "0834-5678-9012", status: "Away", statusColor: const Color.fromARGB(255, 7, 170, 235)),
  Kontak(nama: "Irfan", nomor: "0834-5678-9012", status: "Away", statusColor: const Color.fromARGB(255, 24, 23, 22)),
  Kontak(nama: "Yogi", nomor: "0834-5678-9012", status: "Away", statusColor: const Color.fromARGB(255, 175, 21, 21)),
];

// ───── DASHBOARD ─────
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Interaktif'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          // Soal 1: Produk (SliverGrid) - Ukuran Card Diperkecil & Pas
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Produk Terbaru',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65, // Tetap disesuaikan untuk card kecil
              ),
              itemBuilder: (context, index) => _buildProductCard(products[index]),
            ),
          ),

          // Soal 2: Profil Mahasiswa (SliverToBoxAdapter)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Profil Mahasiswa',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _buildMahasiswaCard(context),
            ),
          ),

          // Soal 3: Daftar Kontak (SliverList)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Daftar Kontak',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList.builder(
              itemCount: daftarKontak.length,
              itemBuilder: (context, index) => _buildKontakTile(context, daftarKontak[index]),
            ),
          ),

          // Spacer di akhir
          SliverToBoxAdapter(
            child: const SizedBox(height: 24),
          ),
        ],
      ),
    );
  }

  // ───── Card Produk Lebih Pas Sesuai Isi ─────
  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                product.color.withOpacity(0.1),
                product.color.withOpacity(0.05),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          // Hapus padding tetap, gunakan padding pada child
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 👈 INI YANG PENTING! Agar Column hanya mengambil ruang sesuai isi
              mainAxisAlignment: MainAxisAlignment.center, // Bisa diganti spaceEvenly jika ingin lebih rata
              children: [
                Icon(product.icon, size: 36, color: product.color),
                const SizedBox(height: 6),
                Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Rp ${product.price.toInt()}",
                  style: TextStyle(
                    color: product.color,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMahasiswaCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 44,
              backgroundColor: Colors.deepPurple.shade100,
              child: Icon(Icons.person, size: 44, color: Colors.deepPurple.shade700),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            mahasiswa.nama,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            "NIM: ${mahasiswa.nim}",
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            mahasiswa.prodi,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Detail mahasiswa ditampilkan")),
              );
            },
            icon: const Icon(Icons.info_outline, size: 18),
            label: const Text("Lihat Detail"),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.deepPurple.shade700,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKontakTile(BuildContext context, Kontak kontak) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.deepPurple, size: 20),
          ),
        ),
        title: Text(
          kontak.nama,
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        subtitle: Text(
          "${kontak.nomor}\nStatus: ${kontak.status}",
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: kontak.statusColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: kontak.statusColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Panggilan"),
                    content: Text("Menelepon ${kontak.nama}?"),
                    actions: [
                      TextButton(onPressed: Navigator.of(ctx).pop, child: const Text("Batal")),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Memanggil ${kontak.nama}...")),
                          );
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("Panggil"),
                      ),
                    ],    
                  ),
                );
              },
              icon: const Icon(Icons.call, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}