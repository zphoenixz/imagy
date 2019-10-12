import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';
// import './pages/login/signUp.dart';

// import './page_two.dart';
// import './pages/conserning.dart';
// import './pages/homePage.dart';

void main() {
  runApp(ImagyApp());
}

class ImagyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagyAppState();
  }
}

class _ImagyAppState extends State<ImagyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        // canvasColor: Colors.yellow[50],
        // primarySwatch: Colors.green,
        // accentColor: Colors.blue[50],
        // buttonColor: Colors.redAccent[100],
        fontFamily: 'Cereal',
      ),
      //home: AuthPage(),// "/" esta reservada para la home page
      routes: {
        '/': (BuildContext context) => new HomePage(), 
        // '/': (BuildContext context) => new LoginPage(), //LOGIN
        // '/signup': (BuildContext context) => new SignUp(),
        // '/concern': (BuildContext context) => new ConcerningPage(), //HomePage

        // "/home": (BuildContext context) => HomePage(),
      },
      // onUnknownRoute: (RouteSettings settings) {
        //como el 404 no encontrado
        // return MaterialPageRoute(
        //  builder: (BuildContext context) => ProductsPage(_products),
        // );
      // },
    );
  }
}