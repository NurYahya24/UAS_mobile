import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:posttest6/screens/detail_page.dart';
import 'data_local.dart';

class FavPage extends StatefulWidget {
  final barang? Barang;
  const FavPage({super.key, this.Barang});

  @override
  State<FavPage> createState() => _FavPage();
}

class _FavPage extends State<FavPage> {
  List _list = barang.listBarang;

  Stream<QuerySnapshot> cekFav() {
    var id = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('favorite')
        .doc(id)
        .collection('barang')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 31, 88),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'Favorite Products',
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
              'My Favorite Products',
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
        StreamBuilder<QuerySnapshot>(
            stream: cekFav(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error saat baca database"),
                    );
                  } else {
                    int panjang = 0;
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      if (snapshot.data!.docs[i]['loved']) {
                        panjang = panjang + 1;
                      }
                    }
                    if (panjang == 0) {
                      return Center(
                        child: Text('Your list is empty'),
                      );
                    } else {
                      return GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 18,
                                mainAxisSpacing: 18),
                        children: [
                          for (int index = 0;
                              index < snapshot.data!.docs.length;
                              index++)
                            if (snapshot.data!.docs[index]['loved'])
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.white
                                              : const Color.fromARGB(
                                                  255, 34, 32, 32),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails(
                                                  id: int.parse(snapshot
                                                      .data!.docs[index].id),
                                                )));
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Image.asset(_list[int.parse(
                                                snapshot.data!.docs[index].id)]
                                            .foto),
                                      ),
                                      Text(
                                        _list[int.parse(
                                                snapshot.data!.docs[index].id)]
                                            .nama
                                            .toString(),
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white),
                                      ),
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Rp. ',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                            Text(
                                              _list[int.parse(snapshot
                                                      .data!.docs[index].id)]
                                                  .harga
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                        ],
                      );
                    }
                  }
              }
            }),
        SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
