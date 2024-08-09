part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteEvent {}

class FavouriteEventInitial extends FavouriteEvent {}

class FavouriteRemoveFromListEvent extends FavouriteEvent {
  final Product product;
  FavouriteRemoveFromListEvent({
    required this.product,
  });
}