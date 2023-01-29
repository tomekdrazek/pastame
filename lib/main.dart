import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PastaMeApp());
}

class PastaMeApp extends StatelessWidget {
  const PastaMeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PastaMe',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),
      darkTheme: ThemeData.from(
          colorScheme: ColorScheme.dark(
              // background: Colors.deepOrange.shade900,
              inversePrimary: Colors.orange.shade800,
              secondary: Colors.orange,
              primary: Colors.orange.shade800)),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'PastaMe'),
    );
  }
}
