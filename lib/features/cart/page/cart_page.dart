import 'package:tech_street/features/cart/bloc/cart_bloc.dart';
import 'package:tech_street/features/home/widgets/app_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/cart_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(
          CartEventInitial(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02,
          vertical: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is CartSuccessState) {
              if (state.cartItems.isNotEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppHeading(
                      heading: "Cart",
                      subHeading: "Summary",
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: state.cartItems.length,
                            itemBuilder: (context, index) {
                              return CartTileWidget(
                                  product: state.cartItems[index]);
                            }))
                  ],
                );
              } else {
                return const Center(
                  child: Text('Cart is empty'),
                );
              }
            }
            return const Center(
              child: Text('Cart is empty'),
            );
          },
        ),
      ),
    );
  }
}
