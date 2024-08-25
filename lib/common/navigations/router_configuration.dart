import 'package:financial_app/common/constants/constans_values.dart';
import 'package:financial_app/common/di/di_initialize.dart';
import 'package:financial_app/features/home/ui/home_screen.dart';
import 'package:financial_app/features/profile/bloc/profile_cubit.dart';
import 'package:financial_app/features/profile/ui/profile_form_screen.dart';
import 'package:financial_app/features/profile/ui/profile_menu_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final routerConfiguration = GoRouter(
  debugLogDiagnostics: true,
  routerNeglect: true,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: ConstansValues.routePath.home,
      name: ConstansValues.routeName.home,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: ConstansValues.routePath.profileMenu,
      name: ConstansValues.routeName.profileMenu,
      builder: (_, __) => const ProfileMenuScreen(),
    ),
    GoRoute(
      path: ConstansValues.routePath.profileForm,
      name: ConstansValues.routeName.profileForm,
      builder: (_, __) => BlocProvider(
        create: (context) => ProfileCubit(
          profileRepository: sl(),
        )..getProfile(),
        child: const ProfileFormScreen(),
      ),
    ),
  ],
);
