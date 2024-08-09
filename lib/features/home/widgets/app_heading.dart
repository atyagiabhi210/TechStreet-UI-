import 'package:flutter/material.dart';

class AppHeading extends StatelessWidget {
  final String heading;
  final String subHeading;
  const AppHeading({
    super.key,
    required this.heading,
    required this.subHeading,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: "$heading ",
              style: Theme.of(context).textTheme.titleMedium),
          TextSpan(
            text: subHeading,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}
