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
    apiKey: 'AIzaSyCHqiuWOuwUrzK_f46hMqoEjHoh-ohxY8E',
    appId: '1:334643559911:web:79e583b57cde3f0b2b5142',
    messagingSenderId: '334643559911',
    projectId: 'fir-flutter-codelab-593a9',
    authDomain: 'fir-flutter-codelab-593a9.firebaseapp.com',
    storageBucket: 'fir-flutter-codelab-593a9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUHEU643Je_4gDPsiKa4ecBu5tlX7Jatc',
    appId: '1:334643559911:android:0d102c813de7c41d2b5142',
    messagingSenderId: '334643559911',
    projectId: 'fir-flutter-codelab-593a9',
    storageBucket: 'fir-flutter-codelab-593a9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKCTO6OMO5Hvj3cJpNLpfdhCTcXKuaGyE',
    appId: '1:334643559911:ios:742bc20f26348dea2b5142',
    messagingSenderId: '334643559911',
    projectId: 'fir-flutter-codelab-593a9',
    storageBucket: 'fir-flutter-codelab-593a9.appspot.com',
    iosClientId: '334643559911-qu8hvbn97jku3iddcn3cv3tcgs7mrov9.apps.googleusercontent.com',
    iosBundleId: 'com.example.gtkFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKCTO6OMO5Hvj3cJpNLpfdhCTcXKuaGyE',
    appId: '1:334643559911:ios:742bc20f26348dea2b5142',
    messagingSenderId: '334643559911',
    projectId: 'fir-flutter-codelab-593a9',
    storageBucket: 'fir-flutter-codelab-593a9.appspot.com',
    iosClientId: '334643559911-qu8hvbn97jku3iddcn3cv3tcgs7mrov9.apps.googleusercontent.com',
    iosBundleId: 'com.example.gtkFlutter',
  );
}