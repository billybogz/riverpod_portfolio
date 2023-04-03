import 'package:flutter/material.dart';

class LoadMoreButtonView extends StatelessWidget {
  const LoadMoreButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromARGB(255, 8, 126, 43);

    const double borderRadius = 40;

    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(color: primaryColor, width: 1.4),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
      ),
      child: Text(
        'Load More',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: primaryColor,
        ),
      ),
    );
  }
}
