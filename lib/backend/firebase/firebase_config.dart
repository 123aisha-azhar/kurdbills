import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC-SzU-yszTYR6_fStFBlO7BQLy8wCExDE",
            authDomain: "kurd-bills.firebaseapp.com",
            projectId: "kurd-bills",
            storageBucket: "kurd-bills.firebasestorage.app",
            messagingSenderId: "632084541773",
            appId: "1:632084541773:web:aef7f849d1a9933eaf4704",
            measurementId: "G-HLHESYL06M"));
  } else {
    await Firebase.initializeApp();
  }
}
