import 'package:flutter/material.dart';
import 'description.dart';
import 'about.dart';
import 'basket.dart';

class HomePage extends StatelessWidget {
  static final List<Widget> basket = [];
  static int totalPrice = 0;

  Widget _listModel(BuildContext context, String name, String image,
      String price, int originalPrice) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            width: 125.0,
            height: 125.0,
          ),
          Container(
            width: 125.0, // Sesuaikan dengan lebar image
            child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Text(name),
                    Container(
                      width: 120.0,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: OutlinedButton(
                              onPressed: () {
                                _alertAddItem(context, name);
                                totalPrice += originalPrice;
                                basket.add(_basket(name, image, price));
                              },
                              style: OutlinedButton.styleFrom(
                                  // Warna latar belakang transparan menggunakan nilai opasitas 0.0
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(135, 73, 36, 1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 15,
                                    height: 15,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/uang.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    price,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  )
                                ],
                              ))),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _basket(String name, String image, String harga) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: 300,
      height: 90,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(159, 129, 95, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 75,
            height: 75,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(135, 73, 36, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/uang.png',
                        width: 15.0,
                        height: 15.0,
                      ),
                    ),
                    Text(
                      harga,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _alertAddItem(BuildContext context, String itemName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Item Ditambahkan"),
          content: Text("$itemName berhasil di tambahkan di keranjang."),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 60,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/logoo.png'), // Sesuaikan dengan path image Anda
                    fit: BoxFit.cover),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 75),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(135, 73, 36, 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "LIST PRODUK",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _listModel(context, 'Model Gaun 1',
                                'assets/dress1.png', 'Rp 300.000', 300000),
                            _listModel(context, 'Model Gaun 2',
                                'assets/dress2.png', 'Rp 350.000', 350000),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _listModel(context, 'Model Gaun 3',
                                'assets/dress3.png', 'Rp 400.000', 400000),
                            _listModel(context, 'Model Gaun 4',
                                'assets/dress4.png', 'Rp 450.000', 450000),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _listModel(context, 'Model Gaun 5',
                                'assets/dress5.png', 'Rp 500.000', 500000),
                            _listModel(context, 'Model Gaun 6',
                                'assets/dress6.png', 'Rp 550.000', 550000),
                          ],
                        )
                      ],
                    ),
                  ),
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
                          onPressed: null,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/icon-home.png'),
                                fit: BoxFit.cover,
                              ),
                              color: const Color.fromRGBO(135, 73, 36, 1),
                              borderRadius:
                                  BorderRadius.circular(12.0), // Radius border
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BasketPage()));
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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
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
