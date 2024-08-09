import 'package:tech_street/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final int size;
  final bool isSelected;
  SizeButton({
    super.key,
    required this.size,
    this.isSelected = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? AppPalette.appWhite : AppPalette.secondaryIcon,
        ),
        borderRadius: BorderRadius.circular(15),
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : AppPalette.appWhite,
      ),
      child: Text(
        size.toString(),
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color:
                  isSelected ? AppPalette.appWhite : AppPalette.secondaryIcon,
            ),
      ),
    );
  }
}
