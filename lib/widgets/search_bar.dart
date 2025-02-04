import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: secondaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        hintText: "Sport area",
        hintStyle: TextStyle(
            color: secondaryColor
                .
                // ignore: deprecated_member_use
                withOpacity(0.8)),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.search, size: 25, color: secondaryColor,),
      ),
    );
  }
}
