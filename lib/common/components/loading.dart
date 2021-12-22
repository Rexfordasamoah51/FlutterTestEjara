import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/loading.gif',
            height: 160,
          ),
          Text(
            'Please wait while we load the data',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
