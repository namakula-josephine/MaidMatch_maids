import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:maidsmatch_maids/admin/addperm.dart';

import '../utils/app_styles.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({super.key});

  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "MAID MATCH",
          style: Styles.headlineStyle,
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.orangeAccent.shade100,
        child: Column(
          children: const [
            DrawerHeader(child: Icon(Icons.favorite)),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('M E S S A G E'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('S E T T I N G S'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('L O G O U T'),
            ),
          ],
        ),
      ),
      backgroundColor: Styles.backgColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Gap(30),
              Text("hello, admin!"),
              Gap(30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child:Column(
                      children: [
                        Text("Wallet"),
                        LottieBuilder.asset("assets/wallet.json",
                            ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(8), 
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child:Column(
                      children: [
                          Text("Performace" ),
                          Gap(10),
                        LottieBuilder.asset("assets/animation_llb16u5r.json",
                        height: 50,
                            ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(8), 
                  ),
                  GestureDetector(
                    onTap : () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => const  addPermFrom(),));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Column(
                        children: [
                          Text("Recruit"),
                           Gap(10),
                          LottieBuilder.asset("assets/recruit.json",
                         
                          height: 60,)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(8), 
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16), 
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Column(
                      children: [
                        Text("Orders"),
                        LottieBuilder.asset("assets/orders.json",
                         
                          height: 60,)

                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(8), 
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(8), 
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(8), 
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}