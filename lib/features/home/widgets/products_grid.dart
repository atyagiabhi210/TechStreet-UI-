import 'package:tech_street/core/data/data.dart';
import 'package:tech_street/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../product_info/page/product_page.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.75,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
              product: products[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProductPage(product: products[index]);
                    },
                  ),
                );
              },
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.height * 0.01,
              ));
        },
        itemCount: products.length,
      ),
    );
  }
}
