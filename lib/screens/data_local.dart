class barang {
  String nama, foto, kategori, desk;
  int harga;
  barang(
      {required this.nama,
      required this.foto,
      required this.kategori,
      required this.harga,
      required this.desk});
  static List<barang> listBarang = [
    barang(
        nama: 'ARM CHAIR',
        foto: 'assets/images/kursi.jpg',
        kategori: 'tables & chairs',
        harga: 200000,
        desk:
            'Introducing our exquisite Arm Chair, a perfect blend of comfort and elegance for your living space. Crafted with meticulous attention to detail, this chair is designed to provide not only a cozy seating experience but also a touch of sophistication to your home. \nThe chair features a sturdy wooden frame ensuring durability and stability. The rich upholstery, available in a variety of colors and textures, adds a luxurious feel to the overall design. The generously padded seat and backrest offer plush comfort, inviting you to unwind and relax.'),
    barang(
        nama: 'VINLIDEN',
        foto: 'assets/images/kursi2.jpg',
        kategori: 'tables & chairs',
        harga: 240000,
        desk:
            'Introducing our Vindilen Arm Chair, a seamless fusion of comfort and elegance for your living space. Meticulously crafted, this chair promises not just a cozy seating experience but also a touch of sophistication to enhance your home. \nThe chair boasts a robust wooden frame, ensuring enduring durability and stability. The opulent Vindilen upholstery, available in a range of colors and textures, adds a sumptuous touch to the overall design. The generously padded seat and backrest offer a plush retreat, encouraging you to unwind and relax.'),
    barang(
        nama: 'LENNART',
        foto: 'assets/images/meja.jpg',
        kategori: 'tables & chairs',
        harga: 240000,
        desk:
            'A simple, slim and practical drawer unit that you can fit almost anywhere. Transparent drawers give you a good overview of what you store and the drawer unit is also easy to move thanks to the castors.'),
    barang(
        nama: 'KNOXHULT',
        foto: 'assets/images/KNOXHULT.png',
        kategori: 'kitchen',
        harga: 6890000,
        desk:
            'KNOXHULT modular kitchen makes it easier to plan, design and survive the kitchen jungle. Combine the modules, add knobs or handles, and finish with functions like organisers, waste management and lighting.'),
    barang(
        nama: 'VARIERA',
        foto: 'assets/images/VARIERA.png',
        kategori: 'kitchen',
        harga: 49900,
        desk:
            'This practical, multi-use box helps you keep track of smaller things and quickly find what you need. You can keep the box in a cabinet, on a worktop or wherever you want at home - and bring it with you.'),
    barang(
        nama: 'STÖDJA',
        foto: 'assets/images/STÖDJA.png',
        kategori: 'kitchen',
        harga: 49900,
        desk:
            'Less time searching, more time for fun - clever fittings inside drawers and cabinets keep things organised. A helpful tip is to keep things close to where they are used as this enables a smooth workflow.'),
    barang(
        nama: 'SUNNERSTA',
        foto: 'assets/images/SUNNERSTA.png',
        kategori: 'kitchen',
        harga: 2594000,
        desk:
            'When every little centimetre counts SUNNERSTA accessories come to the rescue with storage possibilities that keep things close at hand and your worktop free from clutter.'),
    barang(
        nama: 'LILLVIKEN',
        foto: 'assets/images/LILLVIKEN.png',
        kategori: 'kitchen',
        harga: 80000,
        desk:
            'This small sink stopper can make a big difference in your kitchen. Use it together with LILLVIKEN water trap to fill the sink with water or prevent food waste from going down the drain.'),
    barang(
        nama: 'ENHET',
        foto: 'assets/images/ENHET.png',
        kategori: 'bathroom',
        harga: 1050000,
        desk:
            'ENHET series makes it easy to start fresh with a new kitchen solution. This cabinet with shelf is perfect for things like pots, bowls or small appliances. Make it your own with your favourite ENHET door.'),
    barang(
        nama: 'KALKGRUND',
        foto: 'assets/images/KALKGRUND.png',
        kategori: 'bathroom',
        harga: 199000,
        desk:
            'KALKGRUND bathroom organisers make the busiest moments in the bathroom a pure pleasure. You can sense both quality and luxury thanks to hidden screws and the shiny chrome that adds sparkle to your morning.'),
    barang(
        nama: 'ÅBYÅN',
        foto: 'assets/images/ÅBYÅN.png',
        kategori: 'bathroom',
        harga: 49900,
        desk:
            'Treat yourself to an exfoliating scrub - simply lather-up with a few drops of your favourite soap or gel and cleanse. The mesh body puff makes your skin feel smooth and invigorated.'),
    barang(
        nama: 'TACKAN',
        foto: 'assets/images/TACKAN.png',
        kategori: 'bathroom',
        harga: 24900,
        desk:
            'Its easy to see when youre running low on soap, hand sanitiser or whatever you keep in this transparent dispenser. The wide opening minimises spills when its time for a refill.'),
    barang(
        nama: 'TISKEN',
        foto: 'assets/images/TISKEN.png',
        kategori: 'bathroom',
        harga: 29900,
        desk:
            'TISKEN series puts things within easy reach without having to drill any holes into your walls. The tight-grip suction cups wont let go of smooth surfaces like glass or tiles unless you want them to.'),
    barang(
        nama: 'GRUMLAN',
        foto: 'assets/images/GRUMLAN.png',
        kategori: 'bathroom',
        harga: 29900,
        desk:
            'Introducing the GRUMLAN, an innovative water scoop designed by IKOA to redefine your everyday water-carrying experience. Crafted with a perfect blend of Scandinavian simplicity and functional elegance, the GRUMLAN water scoop is a must-have addition to your home.'),
    barang(
        nama: 'ENSEN',
        foto: 'assets/images/ENSEN.png',
        kategori: 'bathroom',
        harga: 995000,
        desk:
            'You save hot water and energy every time you lift the lever. The cold start function avoids the unnecessary use of hot water for daily rituals like washing your hands or brushing your teeth.'),
    barang(
        nama: 'ÅSKSTORM',
        foto: 'assets/images/ÅSKSTORM.png',
        kategori: 'electronic',
        harga: 249000,
        desk:
            'This USB portable charger with 2 ports is hard to live without. The USB-C port is for fast charging (PD) and the USB-A port is for traditional usage - so you can charge 2 devices at the same time!'),
  ];
}
