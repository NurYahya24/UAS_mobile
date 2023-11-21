import 'package:flutter/material.dart';
import 'data_local.dart';

class exploreCategory extends StatefulWidget {
  final kategori;
  final barang? Barang;
  const exploreCategory({super.key, required this.kategori, this.Barang});
  @override
  State<exploreCategory> createState() => _exploreCategoryPageState();
}

class _exploreCategoryPageState extends State<exploreCategory> {
  List _list = barang.listBarang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 31, 88),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Explore by Categories',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(shrinkWrap: true, children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 16),
            child: Text(
              widget.kategori.toString().toUpperCase(),
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
                              _list[index].hagra.toString(),
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
