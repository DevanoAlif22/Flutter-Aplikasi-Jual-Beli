import 'package:flutter/material.dart';
import 'package:myapp/description.dart';
import 'package:myapp/home.dart';
import 'package:myapp/about.dart';

class BasketPage extends StatelessWidget {
  final TextEditingController paymentController = TextEditingController();
  final Color successColor = Colors.green;
  final Color failureColor = Colors.red;

  void _processPayment(BuildContext context) {
    try {
      int payment = int.parse(paymentController.text);
      if (HomePage.totalPrice > 0 &&
          payment > 0 &&
          payment >= HomePage.totalPrice) {
        int returnTotal = payment - HomePage.totalPrice;
        HomePage.totalPrice = 0;
        HomePage.basket.clear();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BasketPage()));
        _alertPayment(
            context,
            "Berhasil membeli semua item di keranjang, kembalian anda adalah Rp. $returnTotal",
            successColor);
      } else if (HomePage.totalPrice == 0) {
        _alertPayment(
            context,
            "Pastikan setidaknya keranjang berisi 1 item!, $payment",
            failureColor);
      } else {
        _alertPayment(
            context,
            "Pastikan uang pembayaran lebih besar daripada total harga",
            failureColor);
      }
    } catch (e) {
      _alertPayment(context, "Pastikan setidaknya keranjang berisi 1 item!",
          failureColor);
    }
  }

  void _alertPayment(BuildContext context, String message, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pembelian Item"),
          content: Text(
            message,
            style: TextStyle(color: color),
          ),
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

  void _alertDeleteItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Item Dihapus"),
          content: const Text("berhasil menghapus seluruh item di keranjang."),
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: 200,
                height: 60,
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logoo.png'),
                    fit: BoxFit.cover,
                  ),
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
                      "KERANJANG",
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
                height: 330,
                child: ListView(children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: HomePage.basket)
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 260,
                    height: 3,
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    color: const Color.fromRGBO(135, 73, 36, 1),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(135, 73, 36, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Total Harga : Rp. " + HomePage.totalPrice.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 10, bottom: 15),
                    width: 120,
                    child: Expanded(
                      child: TextField(
                        controller: paymentController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Pembayaran"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        _processPayment(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(135, 73, 36, 1),
                        ),
                      ),
                      child: const Text(
                        'Bayar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      HomePage.totalPrice = 0;
                      HomePage.basket.clear();
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BasketPage()));
                      _alertDeleteItem(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(135, 73, 36, 1),
                      ),
                    ),
                    child: const Text(
                      'Hapus',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
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
                            offset:
                                Offset(0, 3), // Geser bayangan sejauh X dan Y
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
                            onPressed: null,
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(135, 73, 36, 1),
                                borderRadius: BorderRadius.circular(12.0),
                                image: const DecorationImage(
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
      ),
    );
  }
}
