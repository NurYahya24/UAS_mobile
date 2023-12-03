// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:posttest6/screens/data_local.dart';

class ProductDetails extends StatefulWidget {
  final id;
  final barang? Barang;
  const ProductDetails({super.key, this.id, this.Barang});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  List _list = barang.listBarang;

  void addComment(String komen, String idData) {
    var id = FirebaseAuth.instance.currentUser!.uid;
    var email = FirebaseAuth.instance.currentUser!.email;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final data = {
      "id": id,
      "username": email,
      "komen": komen,
      "tanggal": Timestamp.now(),
      "edited": false,
    };
    db.collection("barang").doc(idData).collection('komen').add(data).then(
        (DocumentSnapshot) => print(
            "Berhasil Menambahkan Komen Dengan  ID : ${DocumentSnapshot.id}"));
  }

  void editComment(String komen, String idData, String idKomen) {
    var id = FirebaseAuth.instance.currentUser!.uid;
    var email = FirebaseAuth.instance.currentUser!.email;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final data = {
      "id": id,
      "username": email,
      "komen": komen,
      "edited": true,
    };
    db
        .collection("barang")
        .doc(idData)
        .collection('komen')
        .doc(idKomen)
        .update(data)
        .then((DocumentSnapshot) =>
            print("Berhasil Mengubah Komen Dengan  ID : ${idKomen}"));
  }

  void delComment(String idKomen, idBarang) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db
        .collection('barang')
        .doc(idBarang)
        .collection('komen')
        .doc(idKomen)
        .delete()
        .then(
            (doc) => print("Document Berhasil Terhapus Dengan id : ${idKomen}"),
            onError: (e) => print("Error $e"));
  }

  void moreOptions(int value, String komen, String idBarang, String idKomen) {
    switch (value) {
      case 0:
        showDialogWithFields(true, komen, idBarang, idKomen);
        break;
      case 1:
        delComment(idKomen, idBarang);
        break;
    }
  }

  void showDialogWithFields(
      bool aksi, String komen, String id, String idKomen) {
    showDialog(
      context: context,
      builder: (_) {
        var commentController = TextEditingController();
        commentController.text = komen;
        return AlertDialog(
          title: aksi ? Text('Edit Comment') : Text('Add Comment'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: commentController,
                  decoration: InputDecoration(hintText: 'write your thoughts'),
                  maxLines: null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                aksi
                    ? editComment(commentController.text, id, idKomen)
                    : addComment(commentController.text, id);
                Navigator.pop(context);
              },
              child: Text('Send'),
            ),
          ],
        );
      },
    );
  }

  Stream<QuerySnapshot> fetchComments(String idDoc) {
    return FirebaseFirestore.instance
        .collection('barang')
        .doc(idDoc)
        .collection('komen')
        .orderBy('tanggal', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 13, 31, 88),
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Product Detail",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Colors.redAccent,
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Image.asset(
              _list[widget.id].foto,
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 40),
            Expanded(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.white
                    : const Color.fromARGB(255, 13, 31, 88),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          _list[widget.id].nama,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Rp. " + _list[widget.id].harga.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                        "Kursi ComfortPro adalah pilihan sempurna untuk menciptakan\nkenyamanan dan gaya di ruang duduk Anda. \n\nDesain ergonomis yang inovatif menjadikan kursi ini pilihan utama untuk mereka yang menghargai kualitas dan fungsionalitas.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey
                                    : Colors.white,
                            fontSize: 15)),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 0.4,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            showDialogWithFields(
                                false, '', widget.id.toString(), '');
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 8,
                            backgroundColor:
                                const Color.fromARGB(255, 13, 31, 88),
                          ),
                          child: Text(
                            'add comment',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),

                    //===========================================================================//
                    // ===================COMMENTS SECTION=======================================//
                    //==========================================================================//
                    StreamBuilder<QuerySnapshot>(
                        stream: fetchComments(widget.id.toString()),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(child: CircularProgressIndicator());
                            default:
                              if (snapshot.hasError) {
                                return Text('Error saat membaca data');
                              } else {
                                if (snapshot.data!.docs.length == 0) {
                                  return Text('Belum ada komen');
                                } else {
                                  return ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        bool cek = false;
                                        if (snapshot.data?.docs[index]['id'] ==
                                            FirebaseAuth
                                                .instance.currentUser?.uid) {
                                          cek = true;
                                        }
                                        final editFlag =
                                            snapshot.data?.docs[index]['edited']
                                                ? '(edited)'
                                                : '';
                                        final idKomen =
                                            snapshot.data?.docs[index].id;
                                        final Timestamp ts =
                                            snapshot.data!.docs[index]
                                                ['tanggal'] as Timestamp;
                                        final DateTime dt = ts.toDate();
                                        var formattedTanggal =
                                            "${dt.day}-${dt.month}-${dt.year}";
                                        return Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? Color.fromARGB(
                                                      255, 255, 255, 255)
                                                  : Colors.black,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight: Radius.circular(24),
                                                  bottomLeft:
                                                      Radius.circular(24),
                                                  bottomRight:
                                                      Radius.circular(24)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  blurRadius: 2,
                                                  spreadRadius: 1,
                                                  offset: Offset(1, 1),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                          child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot.data?.docs[
                                                                        index][
                                                                    'username'] +
                                                                editFlag,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            formattedTanggal,
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      )),
                                                      Visibility(
                                                        visible: cek,
                                                        child: PopupMenuButton<
                                                            int>(
                                                          onSelected: (item) =>
                                                              moreOptions(
                                                                  item,
                                                                  snapshot.data
                                                                              ?.docs[
                                                                          index]
                                                                      ['komen'],
                                                                  widget.id
                                                                      .toString(),
                                                                  idKomen
                                                                      .toString()),
                                                          itemBuilder:
                                                              (context) => [
                                                            PopupMenuItem<int>(
                                                                value: 0,
                                                                child: Text(
                                                                    'Edit')),
                                                            PopupMenuItem<int>(
                                                                value: 1,
                                                                child: Text(
                                                                    'Delete')),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                      snapshot.data?.docs[index]
                                                          ['komen'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .light
                                                              ? Color.fromARGB(
                                                                  255, 0, 0, 0)
                                                              : Colors.white,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                }
                              }
                          }
                        }),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    ));
  }
}
