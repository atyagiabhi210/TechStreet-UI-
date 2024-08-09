import 'dart:developer';

import 'package:tech_street/core/data/data.dart';
import 'package:tech_street/core/models/product.dart';
import 'package:tech_street/core/theme/app_palette.dart';
import 'package:tech_street/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final EdgeInsets margin;
  final Function onTap;
  const ProductCard({
    super.key,
    required this.product,
    this.margin = const EdgeInsets.all(0),
    required this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    if (cartItems.contains(widget.product)) {
      log('Product exists');
      setState(() {
        isSelected = !isSelected;
      });
    } else {
      log('Product does not exist');
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon selectedShoppingBagIcon = Icon(
      Icons.shopping_bag,
      color: Theme.of(context).colorScheme.primary,
    );
    Icon unselectedShoppingBagIcon = Icon(
      Icons.shopping_bag_outlined,
      color: Theme.of(context).colorScheme.primary,
    );

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () => widget.onTap(),
          child: Container(
            margin: widget.margin,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
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
                image: NetworkImage(widget.product.image),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.product.price}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                        if (isSelected == true) {
                          context
                              .read<HomeBloc>()
                              .add(HomeProductAddedToCart(widget.product));
                        } else {
                          context
                              .read<HomeBloc>()
                              .add(HomeProductRemovedFromCart(widget.product));
                        }
                      },
                      icon: isSelected
                          ? selectedShoppingBagIcon
                          : unselectedShoppingBagIcon,
                    )
                  ],
                ),
                Text(
                  widget.product.name,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
