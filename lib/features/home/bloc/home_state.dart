part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final Product product;
  final String message;
  HomeSuccess(
    this.product,
    this.message,
  );
}

final class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
