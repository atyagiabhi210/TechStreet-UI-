import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tech_street/core/data/data.dart';
import 'package:meta/meta.dart';

import '../../../core/models/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeProductAddedToCart>(_onHomeProductAddedToCart);
    on<HomeProductRemovedFromCart>(_onHomeProductRemovedFromCart);
    on<HomeProductAddedToFavourite>(_onHomeProductAddedToFavourite);
    on<HomeProductRemovedFromFavourite>(_onHomeProductRemovedFromFavourite);
  }

  void _onHomeProductAddedToCart(
      HomeProductAddedToCart event, Emitter<HomeState> emit) {
    log('Adding product to cart ${event.product.name}');
    cartItems.add(event.product);
    emit(HomeSuccess(
      event.product,
      '${event.product.name} added to cart',
    ));
    log('Product added to cart successfully ${event.product.name}');
  }

  void _onHomeProductRemovedFromCart(
      HomeProductRemovedFromCart event, Emitter<HomeState> emit) {
    if (cartItems.isEmpty) {
      emit(HomeFailure('Cart is empty'));
    }
    log('Removing product to cart ${event.product.name}');
    cartItems.remove(event.product);
    emit(
      HomeSuccess(
        event.product,
        '${event.product.name}  removed from cart',
      ),
    );
    log('Product removed from cart successfully ${event.product.name}');
  }

  void _onHomeProductAddedToFavourite(
      HomeProductAddedToFavourite event, Emitter<HomeState> emit) {
    log('Adding product to favourites ${event.product.name}');
    favorite.add(event.product);
    emit(HomeSuccess(
      event.product,
      '${event.product.name} added to favourites',
    ));
    log('Product added to favourites successfully ${event.product.name}');
  }

  void _onHomeProductRemovedFromFavourite(
      HomeProductRemovedFromFavourite event, Emitter<HomeState> emit) {
    if (favorite.isEmpty) {
      emit(HomeFailure('Favourites is empty'));
    }
    log('Removing product from favourites ${event.product.name}');
    favorite.remove(event.product);
    emit(
      HomeSuccess(
        event.product,
        '${event.product.name}  removed from favourites',
      ),
    );
    log('Product removed from favourites successfully ${event.product.name}');
  }
}
