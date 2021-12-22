import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
     alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          'assets/404.jpg',
        ),
        Text(
          'Sorry, there was a problem.\nWe will retry after 10 seconds',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        )
      ],
    );
  }
}
