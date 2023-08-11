import 'package:flutter/material.dart';
import 'package:maidsmatch_maids/utils/app_styles.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text("MAID MATCH", style: Styles.headlineStyle, textAlign:TextAlign.center,),
              leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
            ),
      backgroundColor: Styles.backgColor,
      body: SafeArea(
        child: ListView(
          children: [
             
            //  Gap(100),
            //  RevolvingIconsWidget(),
          ],
        )),
    );
  }
}
    
  

    
  
