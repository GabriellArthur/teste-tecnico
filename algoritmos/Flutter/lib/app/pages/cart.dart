import 'dart:math';

import 'package:app/app/pages/home.dart';
import 'package:app/app/pages/sales.dart';
import 'package:app/server/Cart.dart';
import 'package:app/server/product.dart';
import 'package:app/server/sale.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  //mostrar os preços
  num calTotal() {
    num total = 0;
    for (var i = 0; i < Cart.cart.length; i++) {
      total += Cart.cart[i]['price'] * Cart.cart[i]['quantity'];
    }
    return total;
  }

  num calQuantity() {
    num total = 0;
    for (var i = 0; i < Cart.cart.length; i++) {
      total += Cart.cart[i]['quantity'];
    }
    return total;
  }

  num calDiscount() {
    double discount = 0;
    num quantity = calQuantity();
    num price = calTotal();
    if (quantity > 10) {
      discount = price * 0.05;
    } else if (quantity > 20) {
      discount = price * 0.10;
    } else if (quantity > 30) {
      discount = price * 0.20;
    }
    return price - discount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            'Carrinho',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Cart.cart.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          Cart.cart[index]['imageUrl'] ??
                              "https://picsum.photos/200/300",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Cart.cart[index]['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          (Cart.cart[index]['price']).toStringAsFixed(2) ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Quantidade: ${Cart.cart[index]['quantity']}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          //Botão Flutuando
        },
      ),
      //Button
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'R\$ ${calDiscount().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'desconto de R\$ ${(calTotal() - calDiscount()).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  final random = Random();
                  Sale.sale.insert(Sale.sale.length, {
                    'id': random.nextInt(10),
                    'date': DateTime.now(),
                    'items': [...Cart.cart],
                    'price': calDiscount(),
                  });
                  Cart.cart.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SalesPage(),
                    ),
                  );
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.06),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Finalizar Compra',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
