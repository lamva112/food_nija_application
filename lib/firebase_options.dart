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
    apiKey: 'AIzaSyBqVrKdHDL8ed4JIeA1FFeOZFSGyEHsQ9U',
    appId: '1:410962667981:web:c75067450a49752abdfc84',
    messagingSenderId: '410962667981',
    projectId: 'food-ninja-app-66fcd',
    authDomain: 'food-ninja-app-66fcd.firebaseapp.com',
    storageBucket: 'food-ninja-app-66fcd.appspot.com',
    measurementId: 'G-Z7LGWPP764',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdsvOQgdORrIzuDZ_RO3jSaf0r1tDz8hw',
    appId: '1:410962667981:android:a96de79edc495dbcbdfc84',
    messagingSenderId: '410962667981',
    projectId: 'food-ninja-app-66fcd',
    storageBucket: 'food-ninja-app-66fcd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzzT3GCL3XKcGUPHItSwtagnF3AdMV2Hw',
    appId: '1:410962667981:ios:6e1b383f238c9ca7bdfc84',
    messagingSenderId: '410962667981',
    projectId: 'food-ninja-app-66fcd',
    storageBucket: 'food-ninja-app-66fcd.appspot.com',
    iosClientId: '410962667981-j95v468cbgrt6t81vq6c3e9ij6n3s4bs.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodNijaApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDzzT3GCL3XKcGUPHItSwtagnF3AdMV2Hw',
    appId: '1:410962667981:ios:6e1b383f238c9ca7bdfc84',
    messagingSenderId: '410962667981',
    projectId: 'food-ninja-app-66fcd',
    storageBucket: 'food-ninja-app-66fcd.appspot.com',
    iosClientId: '410962667981-j95v468cbgrt6t81vq6c3e9ij6n3s4bs.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodNijaApplication',
  );
}
