import 'package:flutter/material.dart';
import 'data_local.dart';

class ExplorePage extends StatefulWidget {
  final barang? Barang;
  const ExplorePage({super.key, this.Barang});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List _list = barang.listBarang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(shrinkWrap: true, children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 16),
            child: Text(
              'All Product',
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        const SizedBox(
          height: 20,
        ),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 15, right: 15),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 18),
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.white
                              : const Color.fromARGB(255, 34, 32, 32),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(_list[index].foto),
                      ),
                      Text(
                        _list[index].nama.toString(),
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rp. ',
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white),
                            ),
                            Text(
                              _list[index].harga.toString(),
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ));
            }),
        SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
