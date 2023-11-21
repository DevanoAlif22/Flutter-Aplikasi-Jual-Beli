import 'package:flutter/material.dart';
import 'package:myapp/home.dart';
import 'package:myapp/about.dart';
import 'package:myapp/basket.dart';

class DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 645,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/deskripsi.png'), // Sesuaikan dengan path gambar Anda
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 16.0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/logoo.png'), // Sesuaikan dengan path gambar Anda
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 250,
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(135, 73, 36, 1),
                            borderRadius: BorderRadius.circular(40)),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Deskripsi Aplikasi",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 250,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(159, 129, 95, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Tuka Tuku  adalah aplikasi inovatif yang menyajikan pengalaman berbelanja pakaian yang tak tertandingi. Dengan koleksi dress terkini dan tren terpanas, DressEmporium hadir untuk memenuhi kebutuhan fashion Anda dengan mudah dan menyenangkan.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey, // Warna bayangan
                          offset: Offset(0, 3), // Geser bayangan sejauh X dan Y
                          blurRadius: 6, // Jumlah pelebaran bayangan
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icon-home.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BasketPage()),
                            );
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icon-basket.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DescriptionPage()),
                            );
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(135, 73, 36, 1),
                              borderRadius: BorderRadius.circular(12.0),
                              image: const DecorationImage(
                                image: AssetImage('assets/icon-dsc.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutPage()),
                            );
                          },
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icon-about.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            const Text("")
          ],
        ),
      ),
    );
  }
}
