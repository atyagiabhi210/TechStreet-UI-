import 'package:tech_street/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

import '../../../core/models/product.dart';

class AppCarouselItem extends StatelessWidget {
  final Product product;
  const AppCarouselItem({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: AppPalette.boxShadow,
            blurRadius: 10,
          ),
        ],
        color: AppPalette.appWhite,
        image: DecorationImage(
            image: NetworkImage(
              product.image,
            ),
            fit: BoxFit.contain,
            alignment: Alignment.center),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).colorScheme.primary,
                    size: 19,
                  ),
                  Text("${product.rating}"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
