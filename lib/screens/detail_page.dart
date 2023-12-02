import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Product Detail"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Colors.redAccent,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/logo unmul.png",
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 40),
            Expanded(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            child: Text(
                          "Nama Barang",
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
                          child: const Text(
                            "Rp. 1.900.000",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        "Kursi ComfortPro adalah pilihan sempurna untuk menciptakan kenyamanan dan gaya di ruang duduk Anda. Desain ergonomis yang inovatif menjadikan kursi ini pilihan utama untuk mereka yang menghargai kualitas dan fungsionalitas.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.grey, fontSize: 15))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
