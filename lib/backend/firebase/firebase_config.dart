import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDPr4kqkwiXBmfdsvld6kz3k-mdiUPbHO0",
            authDomain: "hacktivatorsff.firebaseapp.com",
            projectId: "hacktivatorsff",
            storageBucket: "hacktivatorsff.firebasestorage.app",
            messagingSenderId: "223987583866",
            appId: "1:223987583866:web:bff5eafd4399026820e4c3",
            measurementId: "G-8HW4TT14YM"));
  } else {
    await Firebase.initializeApp();
  }
}
