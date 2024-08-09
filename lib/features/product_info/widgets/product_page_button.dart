import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';

class ProductPageButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ProductPageButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.primary,
            ),
            foregroundColor: MaterialStateProperty.all(
              AppPalette.appWhite,
            ),
            fixedSize: MaterialStateProperty.all(
              Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.07,
              ),
            ),
          ),
      child: const Text("Add to Bag"),
    );
  }
}
