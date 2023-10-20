import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app.dart';
import 'package:flutter/foundation.dart' as flutter_foundation;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (flutter_foundation.kDebugMode) {
    try {
      FirebaseDatabase.instance.useDatabaseEmulator('192.168.8.110', 9000);
      debugPrint("Using Firebase Emulator");
      // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
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
