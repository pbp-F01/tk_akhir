import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/pages/home_page.dart';
import 'package:goumkm/pages/landing_umkm/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:goumkm/pages/landing_umkm/register.dart';
import 'package:goumkm/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, child) {
          return Provider(
              create: (_) {
                CookieRequest request = CookieRequest();
                return request;
              },
              child: MaterialApp(
                title: 'Goumkm',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                initialRoute: '/home',
                routes: {
                  '/home': (context) => const HomePage(),
                  '/login': (context) => const LoginPage(),
                  '/register': (context) => const Register(),
                },
                home: HomePage(),
              ));
        });
  }
}
