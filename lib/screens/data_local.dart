class barang {
  String nama, foto, kategori;
  int harga;
  barang(
      {required this.nama,
      required this.foto,
      required this.kategori,
      required this.harga});
  static List<barang> listBarang = [
    barang(
        nama: 'ARM CHAIR',
        foto: 'assets/images/kursi.jpg',
        kategori: 'tables & chairs',
        harga: 200000),
    barang(
        nama: 'VINLIDEN',
        foto: 'assets/images/kursi2.jpg',
        kategori: 'tables & chairs',
        harga: 240000),
    barang(
        nama: 'LENNART',
        foto: 'assets/images/meja.jpg',
        kategori: 'tables & chairs',
        harga: 240000),
    barang(
        nama: 'KNOXHULT',
        foto: 'assets/images/KNOXHULT.png',
        kategori: 'kitchen',
        harga: 6890000),
    barang(
        nama: 'VARIERA',
        foto: 'assets/images/VARIERA.png',
        kategori: 'kitchen',
        harga: 49900),
    barang(
        nama: 'STÖDJA',
        foto: 'assets/images/STÖDJA.png',
        kategori: 'kitchen',
        harga: 49900),
    barang(
        nama: 'SUNNERSTA',
        foto: 'assets/images/SUNNERSTA.png',
        kategori: 'kitchen',
        harga: 2594000),
    barang(
        nama: 'LILLVIKEN',
        foto: 'assets/images/LILLVIKEN.png',
        kategori: 'kitchen',
        harga: 80000),
    barang(
        nama: 'ENHET',
        foto: 'assets/images/ENHET.png',
        kategori: 'bathroom',
        harga: 1050000),
    barang(
        nama: 'KALKGRUND',
        foto: 'assets/images/KALKGRUND.png',
        kategori: 'bathroom',
        harga: 199000),
    barang(
        nama: 'ÅBYÅN',
        foto: 'assets/images/ÅBYÅN.png',
        kategori: 'bathroom',
        harga: 49900),
    barang(
        nama: 'TACKAN',
        foto: 'assets/images/TACKAN.png',
        kategori: 'bathroom',
        harga: 24900),
    barang(
        nama: 'TISKEN',
        foto: 'assets/images/TISKEN.png',
        kategori: 'bathroom',
        harga: 29900),
    barang(
        nama: 'GRUMLAN',
        foto: 'assets/images/GRUMLAN.png',
        kategori: 'bathroom',
        harga: 29900),
    barang(
        nama: 'ENSEN',
        foto: 'assets/images/ENSEN.png',
        kategori: 'bathroom',
        harga: 995000),
    barang(
        nama: 'ÅSKSTORM',
        foto: 'assets/images/ÅSKSTORM.png',
        kategori: 'electronic',
        harga: 249000),
  ];
}
