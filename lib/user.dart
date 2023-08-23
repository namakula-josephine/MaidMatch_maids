import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:maidsmatch_maids/homepage.dart';
import 'package:maidsmatch_maids/signin.dart';
import 'package:maidsmatch_maids/welcome_scrn.dart';

class user extends StatelessWidget {
  const user({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData){
                return WelcomeScreen();
              }else {
                return signIn();
              }
            },
            ),
    );
  }
}