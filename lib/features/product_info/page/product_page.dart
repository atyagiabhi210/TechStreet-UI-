import 'dart:developer';

import 'package:tech_street/core/data/data.dart';
import 'package:tech_street/core/theme/app_palette.dart';
import 'package:tech_street/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/product.dart';
import '../widgets/product_page_button.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool _isSelected = false;
  @override
  void initState() {
    super.initState();
    if (favorite.contains(widget.product)) {
      log('Product exists');
      setState(() {
        _isSelected = !_isSelected;
      });
    } else {
      log('Product does not exist');
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon _selectedIcon = Icon(
      Icons.favorite,
      color: Theme.of(context).colorScheme.primary,
    );
    Icon _unselectedIcon = Icon(
      Icons.favorite_outline,
      color: Theme.of(context).colorScheme.primary,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              if (_isSelected) {
                context
                    .read<HomeBloc>()
                    .add(HomeProductRemovedFromFavourite(widget.product));
              } else {
                context
                    .read<HomeBloc>()
                    .add(HomeProductAddedToFavourite(widget.product));
              }
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            icon: _isSelected ? _selectedIcon : _unselectedIcon,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppPalette.appWhite,
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: AppPalette.appWhite,
                boxShadow: [
                  BoxShadow(
                    color: AppPalette.boxShadow,
                    spreadRadius: 1,
                    blurRadius: 10,
                  )
                ],
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.product.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "⭐${widget.product.rating}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                  Text(
                    "\$${widget.product.price.toString()}",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(widget.product.description),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  ProductPageButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeProductAddedToCart(widget.product));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
