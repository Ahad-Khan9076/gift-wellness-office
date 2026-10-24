import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GiftWellnessApp());
}

class GiftWellnessApp extends StatelessWidget {
  const GiftWellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIFT Wellness Office',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
