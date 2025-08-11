import 'package:flutter/material.dart';

void showAppSnackBar(BuildContext context, String message,
    {Color backgroundColor = Colors.green, int milliSeconds = 1000}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(child: Text(message
      , style:Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ))),
      backgroundColor: backgroundColor,
      duration: Duration(milliseconds: milliSeconds ),
    ),
  );
}
