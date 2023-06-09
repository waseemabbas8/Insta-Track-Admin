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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCtYJiSVLgLgTvZ1mLt8hxAatxaXfakx9I',
    appId: '1:226237725544:web:5c038bc4d5c94493e2f4dd',
    messagingSenderId: '226237725544',
    projectId: 'instatrack-e989c',
    authDomain: 'instatrack-e989c.firebaseapp.com',
    storageBucket: 'instatrack-e989c.appspot.com',
    measurementId: 'G-BGC4D6J177',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6x8l4tcLh5exUMSHEE3qP9a4T9RaAikE',
    appId: '1:226237725544:android:aacbdd78a2760b03e2f4dd',
    messagingSenderId: '226237725544',
    projectId: 'instatrack-e989c',
    storageBucket: 'instatrack-e989c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3ScFpA9gVlk3N7mUnn5c7ykYmbsOlLAk',
    appId: '1:226237725544:ios:91cd65372ebf15d2e2f4dd',
    messagingSenderId: '226237725544',
    projectId: 'instatrack-e989c',
    storageBucket: 'instatrack-e989c.appspot.com',
    iosClientId: '226237725544-762ap9g7lccpqbr4amnqfo2uldcu46po.apps.googleusercontent.com',
    iosBundleId: 'com.instatrack.intatrack',
  );
}
