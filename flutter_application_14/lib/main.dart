import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/firebase_options.dart';
import 'package:flutter_application_14/internal/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "app",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
