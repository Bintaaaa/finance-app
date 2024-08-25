import 'package:financial_app/common/navigations/router_configuration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      backButtonDispatcher: RootBackButtonDispatcher(),
      routeInformationProvider: routerConfiguration.routeInformationProvider,
      routeInformationParser: routerConfiguration.routeInformationParser,
      routerDelegate: routerConfiguration.routerDelegate,
    );
  }
}
