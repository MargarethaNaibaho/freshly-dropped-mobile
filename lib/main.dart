import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freshy_food/base/botton_nav.dart';
import 'package:freshy_food/screens/auth/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final String? token = await _getToken();
  runApp(
    // DevicePreview(
    //   builder: (context) => const MyApp(),
    //   enabled: true,
    // ),
    MyApp(
      initialRoute: token != null ? '/home' : '/login'
    )
  );
}

Future<String?> _getToken() async{
  final storage = FlutterSecureStorage();
  return await storage.read(key: 'auth_token');
}
 
class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Freshly Dropped',
      theme: ThemeData(fontFamily: 'Inter'),
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => BottomNavBar(),
      },
      // home: BottomNavBar(),
    );
  }
}