part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartEventInitial extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final Product product;
  CartRemoveFromCartEvent({
    required this.product,
  });
}