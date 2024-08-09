import 'package:carousel_slider/carousel_slider.dart';
import 'package:tech_street/features/home/widgets/app_brand_button.dart';
import 'package:tech_street/features/home/widgets/app_carousel_item.dart';
import 'package:tech_street/features/home/widgets/app_heading.dart';
import 'package:tech_street/features/home/widgets/app_search_bar.dart';
import 'package:tech_street/features/home/widgets/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/data.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02,
          vertical: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
            if (state is HomeSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const AppHeading(
                  heading: "Find Your",
                  subHeading: "Favourite Device",
                ),
                deviceBanner(context),
                const AppSearchBar(),
                brandList(context),
                const ProductsGrid(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container deviceBanner(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: CarouselSlider(
        items: [
          AppCarouselItem(product: products[3]),
          AppCarouselItem(product: products[1]),
          AppCarouselItem(product: products[2]),
        ],
        options: CarouselOptions(
          height: MediaQuery.sizeOf(context).height * 0.25,
          autoPlay: true,
        ),
      ),
    );
  }

  Container brandList(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.01,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: AppBrandButton(
              brand: brands[index],
            ),
          );
        },
      ),
    );
  }
}
