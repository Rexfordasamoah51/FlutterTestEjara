import 'package:ejaratest/common/components/components.dart';
import 'package:ejaratest/home/home_page.dart';
import 'package:ejaratest/login/login.dart';
import 'package:ejaratest/transactions/transactions.dart';
import 'package:flutter/cupertino.dart';


enum Routes { login, home, transactions, bitcoin, ethereum }

/// Dunk router to manag navigation
class AppRouter {
  static AppRouter? _instance;

  AppRouter._();

  /// Singleton
  static AppRouter getInstance() {
    _instance ??= AppRouter._();
    return _instance!;
  }

  /// Generator to manage the bazzer of our navigator
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String? route;
    route = routerHocks(settings);
    return CupertinoPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        switch (route) {
          case 'home':
            return const HomePage();
          case 'login':
          return const LoginPage();
          case 'bitcoin':
            return const Transaction();
          case 'ethereum':
            return const Ethereum();
          case 'tezos':
            return const Tezos();
          default:
            return const AppWrapper(
              child: Text('unkonwn Page'),
            );
        }
      },
    );
  }

  /// Router hocks to manage our navigation--
  String routerHocks(RouteSettings settings) {
    if (settings.name == Routes.login.name) {
      return Routes.login.name;
    } else if (settings.name == Routes.home.name) {
      return Routes.home.name;
    } else {
      return settings.name!;
    }
  }
}
