import 'package:flutter/material.dart';
import 'explore_page.dart';
import 'profile_page.dart';
import 'explore_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> _laman = [
  'Home',
  'Explore',
  'Settings & Profile',
];

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  bool isDarkMode = false;
  static List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    ProfilePage(),
  ];
  void _onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 31, 88),
        centerTitle: true,
        title: Text(
          _laman.elementAt(_index),
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: _pages.elementAt(_index),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 13, 31, 88),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.white,
            selectedItemColor: const Color.fromARGB(251, 207, 230, 0),
            currentIndex: _index,
            onTap: _onItemTap,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> imgList = [
  'assets/images/banner1.jpg',
  'assets/images/banner2.jpg',
  'assets/images/banner3.jpg',
  'assets/images/banner4.jpg'
];

class _HomePageState extends State<HomePage> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
    return Scaffold(
      body: Center(
        child: ListView(children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Produk Populer",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Stack(children: <Widget>[
              Container(
                width: 160,
                height: 100,
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/kursi.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 160,
                height: 100,
                margin: const EdgeInsets.only(left: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/meja.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 160,
                height: 100,
                margin: const EdgeInsets.only(left: 380),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/kursi2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Stack(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 100, left: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ARMCHAIR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'RP. 200.000',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100, left: 200),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'LENNART',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'RP. 240.000',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100, left: 380),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'VINLIDEN',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'RP. 240.000',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ])
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const exploreCategory(
                                  kategori: 'kitchen',
                                )));
                  },
                  child: Container(
                    width: 80,
                    height: 70,
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.dining,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const exploreCategory(
                                  kategori: 'electronic',
                                )));
                  },
                  child: Container(
                    width: 80,
                    height: 70,
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.tv,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const exploreCategory(
                                  kategori: 'tables & chairs',
                                )));
                  },
                  child: Container(
                    width: 80,
                    height: 70,
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.desk,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const exploreCategory(
                                  kategori: 'bathroom',
                                )));
                  },
                  child: Container(
                    width: 80,
                    height: 70,
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.bathroom,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ])),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Offers & Deals",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            children: [
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 3.1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 3,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Theme.of(context).brightness == Brightness.light
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(197, 197, 197, 0.898)
                          : Theme.of(context).brightness == Brightness.light
                              ? Color.fromRGBO(0, 0, 0, 0.4)
                              : Color.fromRGBO(163, 163, 163, 0.894),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Shop By Style",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ElevatedButton(
                child: const Text('Japandi-Inspired Home'),
                onPressed: () {
                  Navigator.pushNamed(context, '/halaman3');
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 13, 31, 88)))))),
          )
        ]),
      ),
    );
  }
}
