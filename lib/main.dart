import 'package:barakallah_hijab/core/routes/app_routes.dart';
import 'package:barakallah_hijab/core/theme/style.dart';
import 'package:barakallah_hijab/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.instance.route(),
        title: 'Barakallah Hijab',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(false, context),
      ),
    );
  }
}
