import 'package:flutter/material.dart';
import 'package:nano_health_task/providers/auth_provider.dart';
import 'package:nano_health_task/screens/bottom_nav_Bar.dart';
import 'package:nano_health_task/screens/login_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return FutureBuilder<bool>(
         future: authProvider.checkAuthState(),
      builder: (_, AsyncSnapshot<bool> snapshot) {
           if(snapshot.hasData)
             {
            return   snapshot.data!?BottomNavBar():LoginScreen();
             }else{
             return const Scaffold(
               body: Center(
                 child: CircularProgressIndicator(),
               ),
             );
           }

      },
        );
  }
}
