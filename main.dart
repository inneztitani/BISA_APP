import 'package:flutter/material.dart';

void main() {
  runApp(BISAApp());
}

class BISAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BISA Platform',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color primaryColor = Color(0xFF003366);
  final Color accentColor = Color(0xFFF9CBA7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Pagi,',
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        Text(
                          'Raymond Almond.',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.shopping_cart_outlined),
                        SizedBox(width: 10),
                        CircleAvatar(backgroundImage: AssetImage('assets/user.jpg')),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF26B4C),
                      ),
                      child: Text('Daftar Sekarang'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Telusuri Kursus',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 180,
                padding: EdgeInsets.only(left: 16),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CourseCard(title: 'Penawaran Terbaik', image: 'assets/course1.png'),
                    CourseCard(title: 'Microsoft Excel: Untuk Pemula', image: 'assets/course2.png'),
                    CourseCard(title: 'Analisis Data Perusahaan', image: 'assets/course3.png'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Daftar Pekerjaan Terbaru',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              JobCard(
                title: 'Admin',
                company: 'PT. Karya Jaya',
                location: 'Bekasi, Indonesia',
                salary: 'Rp. 10,000,000/Bulan',
                tags: ['Disability Friendly', 'Full time'],
              ),
              JobCard(
                title: 'Product Designer',
                company: 'Google inc',
                location: 'Jakarta, Indonesia',
                salary: 'Rp. 12,000,000/Bulan',
                tags: ['Work From Office', 'Full time'],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  child: Text('Lihat lebih banyak pekerjaan'),
                ),
              ),
              SizedBox(height: 20),
              PostCard(
                username: 'Arnold Leonardo',
                time: '21 menit lalu',
                title: 'Pelajaran yang saya dapatkan setelah pindah pekerjaan ke Jabodetabek',
                content:
                    'Saya pertama kali mendapatkan lowongan pekerjaan sebagai administrator di platform BISA...',
              ),
              PostCard(
                username: 'Monica',
                time: '45 menit lalu',
                title: 'Pengalaman saat pindah ke pekerjaan baru',
                content:
                    'Culture shock ketika pindah ke pekerjaan baru adalah hal yang normal. Hal ini bukanlah sesuatu yang salah...',
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  child: Text('Lihat lebih banyak posting'),
                ),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String image;

  CourseCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(image, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String salary;
  final List<String> tags;

  JobCard({required this.title, required this.company, required this.location, required this.salary, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('$company . $location'),
            SizedBox(height: 8),
            Text(salary, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: () {}, child: Text('Daftar')),
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String time;
  final String title;
  final String content;

  PostCard({required this.username, required this.time, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 16),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(time, style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                )
              ],
            ),
            SizedBox(height: 12),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(content),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [Icon(Icons.favorite_border), SizedBox(width: 4), Text('12')]),
                Row(children: [Icon(Icons.chat_bubble_outline), SizedBox(width: 4), Text('10')]),
                Row(children: [Icon(Icons.share_outlined), SizedBox(width: 4), Text('2')]),
              ],
            )
          ],
        ),
      ),
    );
  }
}