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
    apiKey: 'AIzaSyBjnRcV4gM7Z8kou-OVqP83rjI2jMGlifs',
    appId: '1:737189991126:web:ab3dc62202f3aeec6a6f77',
    messagingSenderId: '737189991126',
    projectId: 'betlembosa-auth',
    authDomain: 'betlembosa-auth.firebaseapp.com',
    storageBucket: 'betlembosa-auth.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZtpS9MmFx4CsVCiZkYPNUDIKfhbCfDv8',
    appId: '1:737189991126:android:3efe3f32d652407a6a6f77',
    messagingSenderId: '737189991126',
    projectId: 'betlembosa-auth',
    storageBucket: 'betlembosa-auth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsSdKrb49e7lt554M7-ZP6wlUyd65QMvc',
    appId: '1:737189991126:ios:2cae034cb62b2dae6a6f77',
    messagingSenderId: '737189991126',
    projectId: 'betlembosa-auth',
    storageBucket: 'betlembosa-auth.appspot.com',
    iosBundleId: 'com.example.betlembosa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsSdKrb49e7lt554M7-ZP6wlUyd65QMvc',
    appId: '1:737189991126:ios:bac9559008e439d86a6f77',
    messagingSenderId: '737189991126',
    projectId: 'betlembosa-auth',
    storageBucket: 'betlembosa-auth.appspot.com',
    iosBundleId: 'com.example.betlembosa.RunnerTests',
  );
}