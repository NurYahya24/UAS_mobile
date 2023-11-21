import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double avatarSize = 100.0;
  Color avatarColor = Colors.blue;

  void _animateAvatar() {
    setState(() {
      avatarSize = 350.0;
      avatarColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 31, 88),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          "IKOA FURNITURE",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 2),
              curve: Curves.easeIn,
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: avatarColor,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/kursi.jpg'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _animateAvatar,
              child: Text('Lihat Gambar'),
            ),
            Text(
              'Mohammad Fhadil Hafids Harsandi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'NIM: 2109106072',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Kelas: B1',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
