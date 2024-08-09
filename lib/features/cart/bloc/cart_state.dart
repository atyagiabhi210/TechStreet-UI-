part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState{
  final List<Product> cartItems;
  CartSuccessState(this.cartItems);
}

final class CartFailure extends CartState {
  final String message;
  CartFailure(this.message);
}