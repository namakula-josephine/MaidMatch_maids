import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maidsmatch_maids/services/auth_provider.dart';
import 'package:maidsmatch_maids/signin.dart';
//import 'package:maidsmatch_maids/signin.dart';
import 'package:maidsmatch_maids/user.dart';
//import 'package:maidsmatch_maids/admin/bottomnav.dart';
//import 'package:maidsmatch_maids/welcome.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
//import 'package:maidsmatch_maids/welcome.dart';
//import 'package:maidsmatch_maids/welcome_scrn.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: signIn(),
        title: "MAID MATCH",
      ),
    );
  }
}
