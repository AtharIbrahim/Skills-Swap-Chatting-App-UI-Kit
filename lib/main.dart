//
//
//
//            Develope By :) Athar Ibrahim Khalid
//
//            Published By :) Athar Ibrahim Khalid
//
//            See More Work On
//                -> Github: https://github.com/AtharIbrahim
//                -> Linkedin: https://www.linkedin.com/in/athar-ibrahim-khalid-0715172a2/
//                -> Dribbble: https://dribbble.com/AtharIbrahim
//                -> Website: https://atharibrahimkhalid.netlify.app/
//
//  -This is the modern Skills Swap App
//  -Concept is just like a simple
//
//
//
//

import 'package:flutter/material.dart';
import 'package:skills_swap/routes/routing.dart';
import 'package:skills_swap/routes/routing_string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Route Of Your Application
      onGenerateRoute: Routing().generateRoute,
      // Intial Route
      initialRoute: SplashScreenroute,
    );
  }
}
