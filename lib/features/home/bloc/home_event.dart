part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeProductCardTapped extends HomeEvent {
  final Product product;
  HomeProductCardTapped(this.product);
}

final class HomeProductAddedToCart extends HomeEvent {
  final Product product;
  HomeProductAddedToCart(this.product);
}

final class HomeProductRemovedFromCart extends HomeEvent {
  final Product product;
  HomeProductRemovedFromCart(this.product);
}

final class HomeProductAddedToFavourite extends HomeEvent {
  final Product product;
  HomeProductAddedToFavourite(this.product);
}

final class HomeProductRemovedFromFavourite extends HomeEvent {
  final Product product;
  HomeProductRemovedFromFavourite(this.product);
}
