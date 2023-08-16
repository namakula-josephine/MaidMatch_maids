import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class addPermFrom extends StatefulWidget {
  const addPermFrom({super.key});

  @override
  State<addPermFrom> createState() => _addPermFromState();
}

class _addPermFromState extends State<addPermFrom> {
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

    );
  }
}