import 'package:tech_street/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

import '../../../core/models/brand.dart';

class AppBrandButton extends StatefulWidget {
  final Brand brand;

  const AppBrandButton({
    super.key,
    required this.brand,
  });

  @override
  State<AppBrandButton> createState() => _BrandButtonState();
}

class _BrandButtonState extends State<AppBrandButton> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.04,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isSelected ? AppPalette.appWhite : AppPalette.secondaryIcon,
          ),
          borderRadius: BorderRadius.circular(15),
          color: _isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.brand.name,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: _isSelected
                        ? AppPalette.appWhite
                        : AppPalette.secondaryIcon,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
