import 'package:flutter/material.dart';
import 'package:nano_health_task/providers/auth_provider.dart';
import 'package:nano_health_task/providers/login_provider.dart';
import 'package:nano_health_task/screesns/login_screen.dart';
import 'package:nano_health_task/utilities/theme.dart';
import 'package:nano_health_task/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(context.read),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: buildTheme(Brightness.light),
        routes:  {
          '/': (context) => const Wrapper(),
          '/login': (context) => const LoginScreen(),
        },
      ),
    );
  }
}


