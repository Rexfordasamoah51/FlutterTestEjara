import 'package:ejaratest/common/values/color.dart';
import 'package:ejaratest/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejara Test',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('zh', 'CH'),
      ],
      builder: EasyLoading.init(),
      initialRoute: Routes.login.name,
      onGenerateRoute: AppRouter.getInstance().onGenerateRoute,
    );
  }
}
