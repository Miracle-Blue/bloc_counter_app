import 'package:bloc_lesson_1/domain/cubit/id_cubit.dart';
import 'package:bloc_lesson_1/domain/cubit/internet_cubit.dart';
import 'package:bloc_lesson_1/domain/cubit/settings_cubit.dart';
import 'package:bloc_lesson_1/presentation/router/route_generator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/utils/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.red)
  );
  runApp(
    MyApp(
      route: RouteGenerator(),
      connectivity: Connectivity(),
    ),
  );
}

//! ======================= Generated Route Case ==============================

class MyApp extends StatelessWidget {
  final RouteGenerator route;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.route,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<IdCubit>(
          create: (context) => IdCubit(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BloC App 1',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: route.generateRoute,
      ),
    );
  }
}

//! ======================= Named Route Case ==================================
// class MyApp extends StatefulWidget {
//
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final _cubit = IdCubit();
//
//   @override
//   void dispose() {
//     _cubit.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'BloC App 1',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routes: {
//         HomePage.id: (context) => BlocProvider.value(
//               value: _cubit,
//               child: const HomePage(title: 'Home Page'),
//             ),
//         SecondPage.id: (context) => BlocProvider.value(
//               value: _cubit,
//               child: const SecondPage(title: 'Second Page'),
//             ),
//         ThirdPage.id: (context) => BlocProvider.value(
//               value: _cubit,
//               child: const ThirdPage(title: 'Third Page'),
//             ),
//       },
//     );
//   }
// }
