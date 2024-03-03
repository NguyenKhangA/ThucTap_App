import 'package:flutter/material.dart';

import 'route/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Thi Truong Chung Khoan",

      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,

    );
  }
}
