import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ezwinmobilelegend/controllers/auth_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';

AuthController authController = AuthController.instance;
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA--0IG60fOlj9ypk2ztQxog_aRnUqfAY8",
        authDomain: "ezwinmobilelegend.firebaseapp.com",
        projectId: "ezwinmobilelegend",
        storageBucket: "ezwinmobilelegend.appspot.com",
        messagingSenderId: "460745981442",
        appId: "1:460745981442:web:33dcfe80aa243eb305b11b",
        measurementId: "G-CVZTZSVBQX"));
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
