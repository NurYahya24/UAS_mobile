import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "ALL PRODUCT",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Stack(children: <Widget>[
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
            margin: const EdgeInsets.only(left: 210),
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
              margin: const EdgeInsets.only(top: 100, left: 210),
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
          ]),
        ]),
        Stack(children: <Widget>[
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
            margin: const EdgeInsets.only(left: 210),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: const DecorationImage(
                image: AssetImage('assets/images/meja.jpg'),
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
              margin: const EdgeInsets.only(top: 100, left: 210),
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
          ]),
        ]),
        Stack(children: <Widget>[
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
            margin: const EdgeInsets.only(left: 210),
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
              margin: const EdgeInsets.only(top: 100, left: 210),
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
          ]),
        ]),
        Stack(children: <Widget>[
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
            margin: const EdgeInsets.only(left: 210),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: const DecorationImage(
                image: AssetImage('assets/images/meja.jpg'),
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
              margin: const EdgeInsets.only(top: 100, left: 210),
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
          ]),
        ]),
      ]),
    );
  }
}
