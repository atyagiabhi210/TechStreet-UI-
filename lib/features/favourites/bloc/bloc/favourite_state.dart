part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteSuccessState extends FavouriteState{
  final List<Product> favouriteItems;
  FavouriteSuccessState(this.favouriteItems);
}

final class FavouriteFailure extends FavouriteState {
  final String message;
  FavouriteFailure(this.message);
}