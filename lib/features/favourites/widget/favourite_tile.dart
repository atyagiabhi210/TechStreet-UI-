import 'package:tech_street/core/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_palette.dart';
import '../../product_info/page/product_page.dart';
import '../bloc/bloc/favourite_bloc.dart';

class FavouriteTileWidget extends StatelessWidget {
  final Product product;

  const FavouriteTileWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductPage(
                product: product,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppPalette.appWhite,
          boxShadow: const [
            BoxShadow(
              color: AppPalette.boxShadow,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppPalette.appWhite,
                  boxShadow: const [
                    BoxShadow(
                      color: AppPalette.boxShadow,
                      blurRadius: 10,
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.contain,
                  ),
                )),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(product.description),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          
                          context.read<FavouriteBloc>().add(
                                FavouriteRemoveFromListEvent(
                                  product: product,
                                ),
                              );
                        },
                        icon:const Icon(Icons.favorite)),
                    IconButton(
                        onPressed: () {},
                        icon:const Icon(Icons.shopping_bag_outlined)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
