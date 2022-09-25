import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/managers.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserManager()),
        ChangeNotifierProvider(create: (_) => LoginManager()),
        ChangeNotifierProvider(create: (_) => PictureManager()),
        ChangeNotifierProvider(create: (_) => StudentManager()),
        ChangeNotifierProvider(create: (_) => StudentNavigationManager()),
        ChangeNotifierProvider(create: (_) => TeacherManager()),
        ChangeNotifierProvider(create: (_) => TeacherNavigationManager()),
      ],
      child: MaterialApp(
        title: 'unScrawl',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
