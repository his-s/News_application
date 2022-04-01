import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(MyApp());
}

AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoutting,
    );
  }
}
