import 'package:bloc/bloc.dart';
import 'package:tech_street/core/data/data.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/product.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<FavouriteEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FavouriteEventInitial>(
      (event, emit) {
        emit(FavouriteSuccessState(favorite));
      },
    );
    on<FavouriteRemoveFromListEvent>(_onFavouriteRemoveFromListEvent);
  }
  void _onFavouriteRemoveFromListEvent(
      FavouriteRemoveFromListEvent event, Emitter<FavouriteState> state) {
    if (favorite.isEmpty) {
      state(FavouriteFailure('Favourite is empty'));
    }
    favorite.remove(event.product);
    state(FavouriteSuccessState(favorite));
  }
}
