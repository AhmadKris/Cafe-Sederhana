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
    apiKey: 'AIzaSyCVJcxqdBOgDiXjrGXWlWn5W-FEHzzjkQc',
    appId: '1:210162502581:web:6b05a904b17cc9fd6d67fc',
    messagingSenderId: '210162502581',
    projectId: 'cafe-sederhana',
    authDomain: 'cafe-sederhana.firebaseapp.com',
    databaseURL: 'https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cafe-sederhana.appspot.com',
    measurementId: 'G-R2Y2KWDBPH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxMb2LfyHfwoYKhtxeewSzMG4icdL1L50',
    appId: '1:210162502581:android:47e0b99e330bdb756d67fc',
    messagingSenderId: '210162502581',
    projectId: 'cafe-sederhana',
    databaseURL: 'https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cafe-sederhana.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-ysPqrKNQMOok1DgL6_nXNzrf85u6SLA',
    appId: '1:210162502581:ios:0b39009c4512bb096d67fc',
    messagingSenderId: '210162502581',
    projectId: 'cafe-sederhana',
    databaseURL: 'https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cafe-sederhana.appspot.com',
    iosClientId: '210162502581-0na7d8a65npb1q8s8j7ng34g01skti0s.apps.googleusercontent.com',
    iosBundleId: 'com.example.cafeSederhana',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-ysPqrKNQMOok1DgL6_nXNzrf85u6SLA',
    appId: '1:210162502581:ios:0b39009c4512bb096d67fc',
    messagingSenderId: '210162502581',
    projectId: 'cafe-sederhana',
    databaseURL: 'https://cafe-sederhana-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cafe-sederhana.appspot.com',
    iosClientId: '210162502581-0na7d8a65npb1q8s8j7ng34g01skti0s.apps.googleusercontent.com',
    iosBundleId: 'com.example.cafeSederhana',
  );
}
