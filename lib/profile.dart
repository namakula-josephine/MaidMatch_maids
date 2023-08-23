import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maidsmatch_maids/signin.dart';
import 'package:maidsmatch_maids/utils/app_styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Colors.orangeAccent,
              title: Text("MAID MATCH", style: Styles.headlineStyle, textAlign:TextAlign.center,),
              leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
            ),
      backgroundColor: Styles.backgColor,
      body: Center(
        child: ListView(
          children: [
             
             Gap(50),
             Row(
                                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                Text("phonenumber:" + user.phoneNumber!,
                style: TextStyle(
                  fontSize: 10
                ),
                ),
                
               ],
             ),
             Gap(20),
               Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     MaterialButton(onPressed: () async{
                              try {
                            await FirebaseAuth.instance.signOut();
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => const  signIn(),));
                          // Perform any other necessary actions after successful sign-out.
                             } catch (e) {
                                 print("Sign out error: $e");
                               }
                     },
                     color: Colors.orangeAccent,
                     child: Text('Sign out'),
                     )
                   ],
                 ),
          ],
        )),
    );
  }
}
    
  

    
  
