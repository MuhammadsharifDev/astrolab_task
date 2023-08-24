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
    apiKey: 'AIzaSyAKs8bPZaLaLLLv1p8H8E7qDSBvzkJ9hxg',
    appId: '1:535338227449:web:9485edc532e4b452053428',
    messagingSenderId: '535338227449',
    projectId: 'astrolob-task',
    authDomain: 'astrolob-task.firebaseapp.com',
    storageBucket: 'astrolob-task.appspot.com',
    measurementId: 'G-TK4RC2JVMT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASCVfP-0IfhpcPgCDSNOtJUjC2E50PXSI',
    appId: '1:535338227449:android:a0d63b6183286843053428',
    messagingSenderId: '535338227449',
    projectId: 'astrolob-task',
    storageBucket: 'astrolob-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjw1HLCLzoHnU_511vMBYVdnWKexSgpaA',
    appId: '1:535338227449:ios:3bd032cfbcf39628053428',
    messagingSenderId: '535338227449',
    projectId: 'astrolob-task',
    storageBucket: 'astrolob-task.appspot.com',
    iosClientId: '535338227449-jd6ovk1i3i6tq0u7iphr0722atoaipgs.apps.googleusercontent.com',
    iosBundleId: 'com.example.astrolabbTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjw1HLCLzoHnU_511vMBYVdnWKexSgpaA',
    appId: '1:535338227449:ios:db1fa47586d47bad053428',
    messagingSenderId: '535338227449',
    projectId: 'astrolob-task',
    storageBucket: 'astrolob-task.appspot.com',
    iosClientId: '535338227449-pj5ncb396jt4nfq5d4406m4vppec922r.apps.googleusercontent.com',
    iosBundleId: 'com.example.astrolabbTask.RunnerTests',
  );
}
