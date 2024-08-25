import 'package:financial_app/common/navigations/router_configuration.dart';
import 'package:financial_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injection();
  await initializeDateFormatting('id_ID', null);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
