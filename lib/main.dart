import 'package:flutter/material.dart';

void main() {
  runApp(const CompanyProfileApp());
}

class CompanyProfileApp extends StatelessWidget {
  const CompanyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Company Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CompanyProfilePage(),
    );
  }
}

class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Company Logo
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue.shade300, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  'https:e://Gambar/foto_saya.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Company Name
            const Text(
              'Mukhamad Zaky',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            
            const SizedBox(height: 10),
            
            // Tagline
            const Text(
              'Nim : 231080200056',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            
            const SizedBox(height: 25),
            
            // Company Info Card
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Address Row
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.red),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Kelas : 5B1 INFORMATIKA',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Phone Row
                    Row(
                      children: const [
                        Icon(Icons.phone, color: Colors.green),
                        SizedBox(width: 10),
                        Text(
                          '08133181153',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Email Row
                    Row(
                      children: const [
                        Icon(Icons.email, color: Colors.blue),
                        SizedBox(width: 10),
                        Text(
                          'mukhammadzaky575@gmail.com',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Website Row
                    Row(
                      children: const [
                        Icon(Icons.language, color: Colors.purple),
                        SizedBox(width: 10),
                        Text(
                          'www.umsida.com',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 25),
            
            // About Section
            const Text(
              'About Us',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            
            const SizedBox(height: 10),
            
            const Text(
              'TechInnovate Solutions is a leading technology company specializing in AI, cloud computing, and software development. Founded in 2010, we have helped over 500 businesses transform their digital presence and streamline their operations.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            
            const SizedBox(height: 25),
            
            // Services Section
            const Text(
              'Our Services',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            
            const SizedBox(height: 10),
            
            // Services Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ServiceCard(
                  icon: Icons.computer,
                  title: 'Software Development',
                  color: Colors.blue.shade100,
                ),
                ServiceCard(
                  icon: Icons.cloud,
                  title: 'Cloud Solutions',
                  color: Colors.green.shade100,
                ),
                ServiceCard(
                  icon: Icons.psychology,
                  title: 'AI & Machine Learning',
                  color: Colors.purple.shade100,
                ),
                ServiceCard(
                  icon: Icons.security,
                  title: 'Cybersecurity',
                  color: Colors.red.shade100,
                ),
              ],
            ),
            
            const SizedBox(height: 25),
            
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Action for contact
                  },
                  icon: const Icon(Icons.contact_page),
                  label: const Text('Contact Us'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                
                ElevatedButton.icon(
                  onPressed: () {
                    // Action for portfolio
                  },
                  icon: const Icon(Icons.work),
                  label: const Text('Our Portfolio'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 25),
            
            // Social Media
            const Text(
              'Follow Us',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            
            const SizedBox(height: 15),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaIcon(icon: Icons.facebook, color: Colors.blue),
                SocialMediaIcon(icon: Icons.camera_alt, color: Colors.purple),
                SocialMediaIcon(icon: Icons.alternate_email, color: Colors.blue),
                SocialMediaIcon(icon: Icons.play_arrow, color: Colors.red),
              ],
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Service Card Widget
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  
  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blue.shade800,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Social Media Icon Widget
class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  
  const SocialMediaIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        radius: 25,
        child: Icon(
          icon,
          color: color,
          size: 30,
        ),
      ),
    );
  }
}