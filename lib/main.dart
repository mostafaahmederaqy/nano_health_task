import 'package:flutter/material.dart';
import 'package:nano_health_task/providers/auth_provider.dart';
import 'package:nano_health_task/providers/login_provider.dart';
import 'package:nano_health_task/providers/products_provider.dart';
import 'package:nano_health_task/screens/login_screen.dart';
import 'package:nano_health_task/screens/product_details_screen.dart';
import 'package:nano_health_task/utilities/theme.dart';
import 'package:nano_health_task/wrapper.dart';
import 'package:provider/provider.dart';

import 'providers/product_details_provider.dart';

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
          create: (context) => LoginProvider(context.read),
        ),
        ChangeNotifierProvider<ProductsProvider>(
          create: (context) => ProductsProvider(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: buildTheme(Brightness.light),
        routes:  {
          '/': (context) => const Wrapper(),
          '/login': (context) => const LoginScreen(),
          '/product_details': (context) => const ProductDetailsScreen(),
        },
      ),
    );
  }
}


