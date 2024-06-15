// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// 
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
        return windows;
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
    apiKey: 'AIzaSyADxHrLUlUs7o9rAonmwbYO640APEeMfk8',
    appId: '1:292387217513:web:7f957280c59d10407182f8',
    messagingSenderId: '292387217513',
    projectId: 'prakflutterfirebase-7bf66',
    authDomain: 'prakflutterfirebase-7bf66.firebaseapp.com',
    storageBucket: 'prakflutterfirebase-7bf66.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbZqOfzVJ2hFsUojj7pt22I9qxEF2mH2M',
    appId: '1:292387217513:android:09c1f3b4173fd55c7182f8',
    messagingSenderId: '292387217513',
    projectId: 'prakflutterfirebase-7bf66',
    storageBucket: 'prakflutterfirebase-7bf66.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyADxHrLUlUs7o9rAonmwbYO640APEeMfk8',
    appId: '1:292387217513:web:b459ef1312e63aed7182f8',
    messagingSenderId: '292387217513',
    projectId: 'prakflutterfirebase-7bf66',
    authDomain: 'prakflutterfirebase-7bf66.firebaseapp.com',
    storageBucket: 'prakflutterfirebase-7bf66.appspot.com',
  );
}