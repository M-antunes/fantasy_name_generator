// This widget is the root of your application.
import 'package:fantasy_name_generator/controllers/char_controller.dart';
import 'package:fantasy_name_generator/modules/splash/splash_page.dart';
import 'package:fantasy_name_generator/shared/core/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharController()),
      ],
      child: MaterialApp(
        title: 'Fantasy Character Generator',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        navigatorKey: _navigatorKey,
        home: const SplashPage(),
      ),
    );
  }
}
