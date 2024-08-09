import 'package:tech_street/features/home/widgets/app_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/favourite_bloc.dart';
import '../widget/favourite_tile.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(
          FavouriteEventInitial()
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
        child: BlocConsumer<FavouriteBloc, FavouriteState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is FavouriteSuccessState) {
              if (state.favouriteItems.isNotEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppHeading(
                      heading: "Favourite",
                      subHeading: "List",
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: state.favouriteItems.length,
                            itemBuilder: (context, index) {
                              return FavouriteTileWidget(
                                  product: state.favouriteItems[index]);
                            }))
                  ],
                );
              } else {
                return const Center(
                  child: Text('Favourite is empty'),
                );
              }
            }
            return const Center(
              child: Text('Favourite is empty'),
            );
          },
        ),
      ),
    );
  }
}
