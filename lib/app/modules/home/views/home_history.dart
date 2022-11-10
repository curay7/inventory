import 'dart:html';

import 'package:flutter/material.dart';

final List<Map> myProducts =
    List.generate(12, (index) => {"id": index, "name": "Product $index"})
        .toList();

class HomeHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            return CardList(
              product: myProducts,
            );
          },
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final product;

  const CardList({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => {print("TEST")},
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 60,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFF5F5FA7).withOpacity(0.53),
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 97, 97, 143),
                      Color.fromARGB(255, 75, 75, 112)
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.28),
                      blurRadius: 30,
                    )
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Sep",
                        style: TextStyle(
                            fontSize: 27,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text("27",
                            style: TextStyle(
                                fontSize: 17, color: Colors.grey[300])),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Carlo Ayuban',
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text('Delivered By',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF685BFF),
                        )),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
