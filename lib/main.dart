import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:intra_media/firebase_options.dart';
import 'package:intra_media/login_screen/login_screen.dart';
import 'package:intra_media/splash_screen/splash_screen.dart';
=======
import 'package:flutter/rendering.dart';
import 'package:intra_media/firebase_options.dart';
import 'package:intra_media/prividers/user_providers.dart';
import 'package:intra_media/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
>>>>>>> 5b14e7de52d85e2eef7c8b64481748afe8b188aa

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
<<<<<<< HEAD
  runApp(const MyApp());
=======
  debugPaintSizeEnabled = false;

  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: 
    MyApp(),
  )
  );
>>>>>>> 5b14e7de52d85e2eef7c8b64481748afe8b188aa
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
=======
      debugShowCheckedModeBanner: false,
>>>>>>> 5b14e7de52d85e2eef7c8b64481748afe8b188aa
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
<<<<<<< HEAD

  final String title;

=======
  final String title;
>>>>>>> 5b14e7de52d85e2eef7c8b64481748afe8b188aa
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Splash_Screen();
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 5b14e7de52d85e2eef7c8b64481748afe8b188aa
