import 'package:bloc_login_sreen/src/blocs/form_provider.dart';
import 'package:bloc_login_sreen/src/screens/forgot_password_screen.dart';
import 'package:bloc_login_sreen/src/screens/home_screen.dart';
import 'package:bloc_login_sreen/src/screens/login_screen.dart';
import 'package:bloc_login_sreen/src/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  // render
  @override
  Widget build(BuildContext context) {
    return FormProvider(
      child: MaterialApp(
        title: 'Login_bloc_screen',
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        initialRoute: '/login',
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name == '/login') {
      return MaterialPageRoute(builder: (_) => Login());
    }
    if (routeSettings.name == '/forgot_password') {
      return MaterialPageRoute(builder: (_) => ForgotPassword());
    }
    if (routeSettings.name == '/sign_up') {
      return MaterialPageRoute(builder: (_) => Signup());
    }
    return MaterialPageRoute(builder: (_) => Home());
  }
}
