import 'package:tech_street/core/theme/app_theme.dart';
import 'package:tech_street/features/cart/bloc/cart_bloc.dart';
import 'package:tech_street/features/favourites/bloc/bloc/favourite_bloc.dart';
import 'package:tech_street/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/bloc/home_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => HomeBloc(),
      ),
      BlocProvider(
        create: (_) => CartBloc(),
      ),
      BlocProvider(
        create: (_) => FavouriteBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      home: const LandingPage(),
    );
  }
}
