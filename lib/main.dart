import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/app_config.dart';
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


  Brightness?  _brightness;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _brightness = WidgetsBinding.instance.window.platformBrightness; //  Cihazın kullandığı tema modu alındı .
    _brightness==Brightness.dark? Get.changeThemeMode(ThemeMode.dark) : Get.changeThemeMode(ThemeMode.light); // //  Cihazın kullandığı tema modu , uygulamaya uyarlandı.
    print("Cihazda kullanılan tema modu  :  : $_brightness");
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Dünya saatleri gösterimi",
        initialRoute: RouteName.SPLASH,
        theme: lightTheme,
        darkTheme: darkTheme,
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
