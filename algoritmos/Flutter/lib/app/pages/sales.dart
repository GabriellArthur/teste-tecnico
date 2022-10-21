import 'package:app/app/pages/home.dart';
import 'package:app/server/sale.dart';
import 'package:flutter/material.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  //Converter data em string
  String convertDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String convertHours(DateTime date) {
    return '${date.hour}:${date.minute}h';
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
            'Compras',
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
        shrinkWrap: true,
        itemCount: Sale.sale.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Número da venda: ${Sale.sale[index]['id']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: convertHours(Sale.sale[index]['date']),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: " - "),
                        TextSpan(
                          text: convertDate(Sale.sale[index]['date']),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Valor Total: R\$ ${Sale.sale[index]['price'].toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.7, 40),
                        primary: Colors.white,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        more(Sale.sale[index]['items']);
                      },
                      child: const Text('Ver detalhes'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  more(item) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return FractionallySizedBox(
          heightFactor: .8,
          child: buildMoreWidget(item),
        );
      },
      isScrollControlled: true,
    );
  }

  Widget buildMoreWidget(more) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_downward),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: more.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Produto: ${more[index]['title']}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Quantidade: ${more[index]['quantity']}',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Preço: ${more[index]['price'].toStringAsFixed(2)}R\$',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
