import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp0());
}

class MyApp0 extends StatefulWidget {
  @override
  State createState() => _MyApp0State();
}

class _MyApp0State extends State<MyApp0> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Dünya saatleri gösterim",
        initialRoute: RouteName.SPLASH,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
