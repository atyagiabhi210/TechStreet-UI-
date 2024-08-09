import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
class AppSearchBar extends StatelessWidget {
 
  const AppSearchBar({
    super.key,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.06,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.04,
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppPalette.appWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: AppPalette.boxShadow,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: const Row(
        children: [
          Icon(
            Icons.search,
            color: AppPalette.primaryIcon,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for your favorite shoes",
                hintStyle: TextStyle(
                  color: AppPalette.primaryIcon,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
