import 'dart:html';

import 'package:flutter/material.dart';

class HomeOutStock extends StatefulWidget {
  const HomeOutStock({super.key});

  @override
  State<HomeOutStock> createState() => _HomeOutStockState();
}

class _HomeOutStockState extends State<HomeOutStock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.white,
        child: SizedBox(
          width: 700,
          height: 500,
          child: Center(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: 2,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  child: Center(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'First name'),
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return 'Please enter your first name.';
                        //   }
                        // },
                      ),
                    ],
                  )),
                  width: 500,
                  height: 700,
                  color: Colors.grey[200],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
