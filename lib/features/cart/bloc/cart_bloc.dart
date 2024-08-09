import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tech_street/core/data/data.dart';
import 'package:meta/meta.dart';

import '../../../core/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {});
    on<CartRemoveFromCartEvent>(_onCartRemoveFromCartEvent);
    on<CartEventInitial>(
      (event, emit) {
        emit(CartSuccessState(cartItems));
      },
    );
  }

  void _onCartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    if (cartItems.isEmpty) {
      emit(CartFailure('Cart is empty'));
    }
    log('Removing product to cart ${event.product.name}');
    cartItems.remove(event.product);
    emit(
      CartSuccessState(
        cartItems,
      ),
    );
    log('Product removed from cart successfully ${event.product.name}');
  }
}
