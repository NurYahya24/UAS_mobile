import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'signin_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: Text("Selanjutnya"),
      done: Text("Selesai"),
      onDone: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return SignInScreen();
            },
          ),
        );
      },
      pages: [
        PageViewModel(
          title:
              "Halo, Selamat datang di IKOA Store - Portal Elegansi untuk Ruang Anda!",
          body:
              "Kami dengan bangga mempersembahkan kepada Anda solusi inovatif untuk semua kebutuhan furnitur Anda",
          image: Image.asset("assets/images/logo-light.png"),
        ),
        PageViewModel(
          title: "Temukan ribuan pilihan furnitur berkualitas tinggi",
          body:
              "Mulai dari mebel modern hingga sentuhan klasik yang abadi. IKOA Store dirancang untuk memberikan pengalaman belanja yang nyaman dan efisien",
          image: Image.asset("assets/images/intro2.jpg"),
        ),
        PageViewModel(
          title:
              "Nikmati kemudahan berbelanja furnitur online tanpa batasan waktu atau tempat",
          body:
              "Dengan layanan pelanggan yang sangat responsif, tim kami selalu siap membantu Anda dalam setiap langkah perjalanan Anda",
          image: Image.asset("assets/images/intro3.jpg"),
        ),
      ],
    );
  }
}
