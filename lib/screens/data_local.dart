class barang {
  String nama, foto, kategori;
  int hagra;
  barang(
      {required this.nama,
      required this.foto,
      required this.kategori,
      required this.hagra});
  static List<barang> listBarang = [
    barang(
        nama: 'ARM CHAIR',
        foto: 'assets/images/kursi.jpg',
        kategori: 'tables & chairs',
        hagra: 200000),
    barang(
        nama: 'VINLIDEN',
        foto: 'assets/images/kursi2.jpg',
        kategori: 'tables & chairs',
        hagra: 240000),
    barang(
        nama: 'LENNART',
        foto: 'assets/images/meja.jpg',
        kategori: 'tables & chairs',
        hagra: 240000),
    barang(
        nama: 'KNOXHULT',
        foto: 'assets/images/KNOXHULT.png',
        kategori: 'kitchen',
        hagra: 6890000),
    barang(
        nama: 'VARIERA',
        foto: 'assets/images/VARIERA.png',
        kategori: 'kitchen',
        hagra: 49900),
    barang(
        nama: 'STÖDJA',
        foto: 'assets/images/STÖDJA.png',
        kategori: 'kitchen',
        hagra: 49900),
    barang(
        nama: 'SUNNERSTA',
        foto: 'assets/images/SUNNERSTA.png',
        kategori: 'kitchen',
        hagra: 2594000),
    barang(
        nama: 'LILLVIKEN',
        foto: 'assets/images/LILLVIKEN.png',
        kategori: 'kitchen',
        hagra: 80000),
  ];

  int callLengthCategories(String? kategori) {
    int panjang = 0;
    for (int i = 0; i < listBarang.length; i++) {
      if (listBarang[i].kategori.toString() == kategori.toString()) {
        panjang += 1;
      }
    }
    return panjang;
  }
}
