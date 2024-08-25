import 'package:financial_app/common/constants/constans_values.dart';
import 'package:financial_app/features/home/ui/home_screen.dart';
import 'package:go_router/go_router.dart';

final routerConfiguration = GoRouter(debugLogDiagnostics: true, routerNeglect: true, initialLocation: "/", routes: [
  GoRoute(
    path: ConstansValues.routePath.home,
    name: ConstansValues.routeName.home,
    builder: (_, __) => const HomeScreen(),
  ),
]);
