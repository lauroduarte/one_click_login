import 'package:flutter/material.dart';

import 'screens/login_page/login_page.dart';
import 'screens/first_screen/first_screen.dart';


const LoginPageRoute = '/';
const FirstScreenRoute = '/first_screen';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      //theme: ThemeData(
      //  primarySwatch: Colors.blue,
      //),
      theme: _theme(),
      onGenerateRoute: _routes()
    );
  }

  

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LoginPageRoute:
          screen = LoginPage();
          break;
        case FirstScreenRoute:
          screen = FirstScreen();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
        //appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
        //textTheme: TextTheme(
        //  title: TitleTextStyle,
        //  subtitle: SubTitleTextStyle,
        //  caption: CaptionTextStyle,
        //  body1: Body1TextStyle,
        //),
        primarySwatch: Colors.blue
    );
  }

}



