import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C63FF)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// Home Screen - Navigasi utama
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> _menus = const [
    {
      'title': 'Container',
      'subtitle': 'Kotak berwarna',
      'icon': Icons.crop_square_rounded,
      'color': Color(0xFF6C63FF),
    },
    {
      'title': 'GridView',
      'subtitle': 'Minimal 6 item (grid)',
      'icon': Icons.grid_view_rounded,
      'color': Color(0xFF00BCD4),
    },
    {
      'title': 'ListView',
      'subtitle': '3 item (A, B, C)',
      'icon': Icons.list_rounded,
      'color': Color(0xFF4CAF50),
    },
    {
      'title': 'ListView.builder',
      'subtitle': 'List dari data array',
      'icon': Icons.view_list_rounded,
      'color': Color(0xFFFF9800),
    },
    {
      'title': 'ListView.separated',
      'subtitle': 'List + garis pembatas',
      'icon': Icons.format_list_bulleted_rounded,
      'color': Color(0xFFE91E63),
    },
    {
      'title': 'Stack',
      'subtitle': 'Tampilan bertumpuk',
      'icon': Icons.layers_rounded,
      'color': Color(0xFF9C27B0),
    },
  ];

  void _navigate(BuildContext context, String title) {
    Widget screen;
    switch (title) {
      case 'Container':
        screen = const ContainerScreen();
        break;
      case 'GridView':
        screen = const GridViewScreen();
        break;
      case 'ListView':
        screen = const ListViewScreen();
        break;
      case 'ListView.builder':
        screen = const ListViewBuilderScreen();
        break;
      case 'ListView.separated':
        screen = const ListViewSeparatedScreen();
        break;
      case 'Stack':
        screen = const StackScreen();
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text('Pilih Widget',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
              const Text('Ketuk kartu untuk melihat contoh widget',
                  style: TextStyle(fontSize: 13, color: Color(0xFF888888))),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: _menus.length,
                  itemBuilder: (context, index) {
                    final item = _menus[index];
                    final color = item['color'] as Color;
                    return GestureDetector(
                      onTap: () => _navigate(context, item['title'] as String),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(item['icon'] as IconData, color: color, size: 26),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['title'] as String,
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold, color: color)),
                                const SizedBox(height: 2),
                                Text(item['subtitle'] as String,
                                    style: const TextStyle(fontSize: 11, color: Color(0xFF888888)),
                                    maxLines: 2),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 1. Container Screen
class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        title: const Text('Container Widget'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoBox(
              'Container adalah widget kotak yang dapat diberi warna, padding, margin, border, shadow, dan dekorasi lainnya.',
              const Color(0xFF6C63FF),
            ),
            const SizedBox(height: 24),

            _sectionTitle('1. Container Dasar Berwarna'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorBox(Colors.red, 'Merah'),
                _colorBox(Colors.green, 'Hijau'),
                _colorBox(Colors.blue, 'Biru'),
              ],
            ),

            const SizedBox(height: 24),
            _sectionTitle('2. Container dengan BorderRadius'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF9800),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Text('Rounded', style: TextStyle(color: Colors.white, fontSize: 11))),
                ),
                Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE91E63),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(child: Text('Circle', style: TextStyle(color: Colors.white, fontSize: 11))),
                ),
                Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF9C27B0),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: const Center(child: Text('Custom', style: TextStyle(color: Colors.white, fontSize: 11))),
                ),
              ],
            ),

            const SizedBox(height: 24),
            _sectionTitle('3. Container dengan Border'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity, height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF6C63FF), width: 2),
              ),
              child: const Center(
                child: Text('Container dengan Border',
                    style: TextStyle(color: Color(0xFF6C63FF), fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: 24),
            _sectionTitle('4. Container dengan BoxShadow'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity, height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Color(0x336C63FF), blurRadius: 16, spreadRadius: 2, offset: Offset(0, 6)),
                ],
              ),
              child: const Center(
                child: Text('Container dengan BoxShadow',
                    style: TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: 24),
            _sectionTitle('5. Container dengan Gradient'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity, height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF00BCD4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Text('Container dengan Gradient',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: 24),
            _sectionTitle('6. Container dengan Padding & Margin'),
            const SizedBox(height: 10),
            Container(
              color: const Color(0xFF00BCD4).withOpacity(0.1),
              padding: const EdgeInsets.all(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF00BCD4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text('Inner Container (padding 16, margin 8)',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _colorBox(Color color, String label) {
    return Container(
      width: 80, height: 80,
      color: color,
      child: Center(child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12))),
    );
  }
}

// 2. GridView Screen
class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  final List<Map<String, dynamic>> _items = const [
    {'title': 'Apel',   'icon': Icons.apple,               'color': Color(0xFFE53935)},
    {'title': 'Musik',  'icon': Icons.music_note,          'color': Color(0xFF8E24AA)},
    {'title': 'Foto',   'icon': Icons.photo_camera,        'color': Color(0xFF1E88E5)},
    {'title': 'Chat',   'icon': Icons.chat_bubble,         'color': Color(0xFF43A047)},
    {'title': 'Video',  'icon': Icons.play_circle_fill,    'color': Color(0xFFFF7043)},
    {'title': 'Maps',   'icon': Icons.map,                 'color': Color(0xFF00ACC1)},
    {'title': 'Buku',   'icon': Icons.book,                'color': Color(0xFFFFB300)},
    {'title': 'Game',   'icon': Icons.sports_esports,      'color': Color(0xFF6C63FF)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00BCD4),
        foregroundColor: Colors.white,
        title: const Text('GridView Widget'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoBox(
              'GridView menampilkan widget dalam susunan grid. Contoh ini menggunakan GridView.count dengan 2 kolom dan 8 item.',
              const Color(0xFF00BCD4),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: _items.map((item) {
                  final color = item['color'] as Color;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: color.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 3)),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 54, height: 54,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(item['icon'] as IconData, color: color, size: 30),
                        ),
                        const SizedBox(height: 10),
                        Text(item['title'] as String,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. ListView Screen (A, B, C)
class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        title: const Text('ListView Widget'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _infoBox(
              'ListView statis menampilkan item yang sudah ditentukan. Contoh berikut memiliki 3 item: A, B, dan C.',
              const Color(0xFF4CAF50),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _listItem(label: 'A', title: 'Item A', subtitle: 'Ini adalah item pertama dalam ListView', color: const Color(0xFF4CAF50), icon: Icons.star_rounded),
                  const SizedBox(height: 12),
                  _listItem(label: 'B', title: 'Item B', subtitle: 'Ini adalah item kedua dalam ListView',  color: const Color(0xFF2196F3), icon: Icons.favorite_rounded),
                  const SizedBox(height: 12),
                  _listItem(label: 'C', title: 'Item C', subtitle: 'Ini adalah item ketiga dalam ListView', color: const Color(0xFFFF9800), icon: Icons.bolt_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listItem({required String label, required String title, required String subtitle, required Color color, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: color.withOpacity(0.15), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            width: 52, height: 52,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
            child: Center(
              child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF777777))),
              ],
            ),
          ),
          Icon(icon, color: color.withOpacity(0.5), size: 24),
        ],
      ),
    );
  }
}

// 4. ListView.builder Screen (Dinamis dari Array)
class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  static const List<Map<String, String>> _data = [
    {'nama': 'Andi Pratama',    'nim': '2021001', 'prodi': 'Teknik Informatika', 'ipk': '3.85'},
    {'nama': 'Budi Santoso',    'nim': '2021002', 'prodi': 'Sistem Informasi',   'ipk': '3.72'},
    {'nama': 'Citra Dewi',      'nim': '2021003', 'prodi': 'Teknik Informatika', 'ipk': '3.91'},
    {'nama': 'Dedi Kurniawan',  'nim': '2021004', 'prodi': 'Ilmu Komputer',      'ipk': '3.65'},
    {'nama': 'Eka Putri',       'nim': '2021005', 'prodi': 'Sistem Informasi',   'ipk': '3.78'},
    {'nama': 'Fajar Nugroho',   'nim': '2021006', 'prodi': 'Teknik Informatika', 'ipk': '3.55'},
    {'nama': 'Gita Sari',       'nim': '2021007', 'prodi': 'Ilmu Komputer',      'ipk': '3.88'},
    {'nama': 'Hendra Wijaya',   'nim': '2021008', 'prodi': 'Sistem Informasi',   'ipk': '3.60'},
  ];

  static const List<Color> _colors = [
    Color(0xFFE53935), Color(0xFF8E24AA), Color(0xFF1E88E5), Color(0xFF43A047),
    Color(0xFFFF7043), Color(0xFF00ACC1), Color(0xFFFFB300), Color(0xFF6C63FF),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF9800),
        foregroundColor: Colors.white,
        title: const Text('ListView.builder'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _infoBox(
              'ListView.builder membuat list secara dinamis dari array data. Total ${_data.length} mahasiswa ditampilkan.',
              const Color(0xFFFF9800),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _data.length,
                itemBuilder: (context, index) {
                  final item = _data[index];
                  final color = _colors[index % _colors.length];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32, height: 32,
                          decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text('${index + 1}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color))),
                        ),
                        const SizedBox(width: 12),
                        CircleAvatar(
                          radius: 22, backgroundColor: color,
                          child: Text(item['nama']![0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['nama']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
                              Text('NIM: ${item['nim']}  •  ${item['prodi']}', style: const TextStyle(fontSize: 11, color: Color(0xFF888888))),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: Text(item['ipk']!, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 5. ListView.separated Screen (Dengan Divider)
class ListViewSeparatedScreen extends StatelessWidget {
  const ListViewSeparatedScreen({super.key});

  static const List<Map<String, String>> _menu = [
    {'nama': 'Nasi Goreng',   'harga': 'Rp 15.000', 'kategori': 'Makanan Berat'},
    {'nama': 'Mie Ayam',      'harga': 'Rp 13.000', 'kategori': 'Makanan Berat'},
    {'nama': 'Ayam Geprek',   'harga': 'Rp 18.000', 'kategori': 'Makanan Berat'},
    {'nama': 'Es Teh Manis',  'harga': 'Rp 5.000',  'kategori': 'Minuman'},
    {'nama': 'Jus Alpukat',   'harga': 'Rp 12.000', 'kategori': 'Minuman'},
    {'nama': 'Es Jeruk',      'harga': 'Rp 7.000',  'kategori': 'Minuman'},
    {'nama': 'Pisang Goreng', 'harga': 'Rp 8.000',  'kategori': 'Snack'},
    {'nama': 'Tempe Mendoan', 'harga': 'Rp 6.000',  'kategori': 'Snack'},
    {'nama': 'Cireng',        'harga': 'Rp 5.000',  'kategori': 'Snack'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
        title: const Text('ListView.separated'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _infoBox(
              'ListView.separated sama seperti builder, namun dengan separator (garis pembatas) di antara setiap item.',
              const Color(0xFFE91E63),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 3))],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: ListView.separated(
                    itemCount: _menu.length,
                    separatorBuilder: (_, __) => const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0), indent: 70, endIndent: 16),
                    itemBuilder: (context, index) {
                      final item = _menu[index];
                      final Map<String, Color> catColors = {
                        'Makanan Berat': const Color(0xFFFF7043),
                        'Minuman':       const Color(0xFF1E88E5),
                        'Snack':         const Color(0xFFFFB300),
                      };
                      final Map<String, IconData> catIcons = {
                        'Makanan Berat': Icons.rice_bowl_rounded,
                        'Minuman':       Icons.local_drink_rounded,
                        'Snack':         Icons.cookie_rounded,
                      };
                      final color = catColors[item['kategori']] ?? const Color(0xFF888888);
                      final icon  = catIcons[item['kategori']]  ?? Icons.fastfood;
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        leading: Container(
                          width: 44, height: 44,
                          decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
                          child: Icon(icon, color: color, size: 22),
                        ),
                        title: Text(item['nama']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF333333))),
                        subtitle: Text(item['kategori']!, style: TextStyle(fontSize: 12, color: color)),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(color: const Color(0xFFE91E63).withOpacity(0.08), borderRadius: BorderRadius.circular(8)),
                          child: Text(item['harga']!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFFE91E63))),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 6. Stack Screen (Widget Bertumpuk)
class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9C27B0),
        foregroundColor: Colors.white,
        title: const Text('Stack Widget'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoBox(
              'Stack menumpuk beberapa widget di atas satu sama lain. Gunakan Positioned untuk mengatur posisinya.',
              const Color(0xFF9C27B0),
            ),

            const SizedBox(height: 24),
            _sectionTitle('1. Stack Dasar (Kotak Bertumpuk)'),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                width: 200, height: 200,
                child: Stack(
                  children: [
                    Container(width: 200, height: 200, decoration: BoxDecoration(color: const Color(0xFF9C27B0).withOpacity(0.25), borderRadius: BorderRadius.circular(12))),
                    Positioned(
                      top: 25, left: 25,
                      child: Container(width: 150, height: 150, decoration: BoxDecoration(color: const Color(0xFF9C27B0).withOpacity(0.5), borderRadius: BorderRadius.circular(10))),
                    ),
                    Positioned(
                      top: 55, left: 55,
                      child: Container(
                        width: 90, height: 90,
                        decoration: BoxDecoration(color: const Color(0xFF9C27B0), borderRadius: BorderRadius.circular(8)),
                        child: const Center(child: Text('Stack!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            _sectionTitle('2. Stack: Teks di atas Container'),
            const SizedBox(height: 12),
            Stack(
              children: [
                Container(
                  width: double.infinity, height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF9C27B0), Color(0xFF6C63FF)],
                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  top: -20, right: -20,
                  child: Container(width: 120, height: 120, decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), shape: BoxShape.circle)),
                ),
                Positioned(
                  bottom: -30, left: 50,
                  child: Container(width: 100, height: 100, decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), shape: BoxShape.circle)),
                ),
                const Positioned(
                  left: 20, top: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Stack Widget', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 6),
                      Text('Teks di atas Container\ndengan Positioned', style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            _sectionTitle('3. Stack: Kartu Profil Bertumpuk'),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                width: 280, height: 290,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 50,
                      child: Container(
                        width: 280, height: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: const Color(0xFF9C27B0).withOpacity(0.2), blurRadius: 16, offset: const Offset(0, 6))],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 90, height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, color: const Color(0xFF9C27B0),
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [BoxShadow(color: const Color(0xFF9C27B0).withOpacity(0.4), blurRadius: 12)],
                        ),
                        child: const Icon(Icons.person, color: Colors.white, size: 48),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      child: SizedBox(
                        width: 260,
                        child: Column(
                          children: [
                            const Text('Rangga Pradarrell F.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
                            const SizedBox(height: 4),
                            const Text('Mahasiswa Teknik Informatika', style: TextStyle(fontSize: 12, color: Color(0xFF888888))),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _statCol('12', 'Tugas'),
                                Container(width: 1, height: 30, color: const Color(0xFFEEEEEE)),
                                _statCol('7', 'Modul'),
                                Container(width: 1, height: 30, color: const Color(0xFFEEEEEE)),
                                _statCol('3.85', 'IPK'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _statCol(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF9C27B0))),
        Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF888888))),
      ],
    );
  }
}

// Helper Widgets
Widget _infoBox(String text, Color color) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: color.withOpacity(0.08),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color.withOpacity(0.3)),
    ),
    child: Text(text, style: const TextStyle(fontSize: 13, color: Color(0xFF555555))),
  );
}

Widget _sectionTitle(String title) {
  return Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF444444)));
}
