import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maidsmatch_maids/utils/app_styles.dart';
import 'package:intl/intl.dart';
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _auth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> _usersStream =
   FirebaseFirestore.instance
              .collection('Laundry order')
              .where('category',isEqualTo: 'Laundry')
            //  .where('userid', isEqualTo:  '${FirebaseAuth.instance.currentUser?.uid}')
              .snapshots();
     final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('orders');

  // Stream documents where the 'status' field is equal to 'active'
  Stream<QuerySnapshot> streamOrders() {
    return userCollection.where('status', isEqualTo:  'pending').snapshots();
  }


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
      body:StreamBuilder<QuerySnapshot>(
        stream: streamOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          print(snapshot.data?.docs.first);
           Fluttertoast.showToast(
        msg: '${snapshot.data?.docs.length} orders',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      if (!snapshot.hasData) {
              return Text('Loading...');}
                final List<QueryDocumentSnapshot> activeUsers = snapshot.data!.docs;
          if (snapshot.hasData) {
           //   return Text('Loading...');
           return    ListView.builder(
            itemCount: activeUsers.length,
            itemBuilder: (context, index) {
              final userData = activeUsers[index].data() as Map<String, dynamic>;
               var date = userData['date'];
               if (date != null){
                   date = DateFormat('yyyy-MM-dd').format(userData['start-time'].toDate().toLocal()).toString()+'         '+DateFormat('h:mm a').format(userData['date'].toDate()).toString();
               } else {
                date = '';
               }
              return ListTile(
                title: Row(
                  children: [
                    Text(userData['category'] ?? ''),SizedBox(width: 100),
                    ElevatedButton(onPressed: (){}, child: Text('ACCEPT')),
                    ElevatedButton(onPressed: (){}, child: Text('DECLINE'))
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(date ?? '',),SizedBox(width: 20),
                    Text(userData['status'],style: TextStyle(
                  color: userData['status']=='Pending' ? Colors.red : Colors.green,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                        ),),
                  ],
                ),
                // ... other UI elements for each document
              );
            },
          );
            }
           if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        }
      )
      );
  }
}
    
  

    
  
