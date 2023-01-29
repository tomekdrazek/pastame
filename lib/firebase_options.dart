// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCU9y_v1jEodCGTnq-7DEbmO7YK3pnGDn0',
    appId: '1:230809507437:web:9441eccd8cfb4e8e8b5164',
    messagingSenderId: '230809507437',
    projectId: 'pasta-me',
    authDomain: 'pasta-me.firebaseapp.com',
    databaseURL: 'https://pasta-me-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'pasta-me.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCD8hwnBYyKefzGTRTb3GhkfCjGb-m0Js8',
    appId: '1:230809507437:android:42979ce4f694fa858b5164',
    messagingSenderId: '230809507437',
    projectId: 'pasta-me',
    databaseURL: 'https://pasta-me-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'pasta-me.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjmjUgDc-4cQ9vd2qz2Lm-xX4eXkvu130',
    appId: '1:230809507437:ios:405c06e9499bee368b5164',
    messagingSenderId: '230809507437',
    projectId: 'pasta-me',
    databaseURL: 'https://pasta-me-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'pasta-me.appspot.com',
    iosClientId: '230809507437-rf5hdjp76thm4c80ggn2fm3qvahqosg5.apps.googleusercontent.com',
    iosBundleId: 'com.example.pastame',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjmjUgDc-4cQ9vd2qz2Lm-xX4eXkvu130',
    appId: '1:230809507437:ios:405c06e9499bee368b5164',
    messagingSenderId: '230809507437',
    projectId: 'pasta-me',
    databaseURL: 'https://pasta-me-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'pasta-me.appspot.com',
    iosClientId: '230809507437-rf5hdjp76thm4c80ggn2fm3qvahqosg5.apps.googleusercontent.com',
    iosBundleId: 'com.example.pastame',
  );
}
