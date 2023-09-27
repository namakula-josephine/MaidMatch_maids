import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:maidsmatch_maids/utils/app_styles.dart';
import 'orders.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:intl/intl.dart';
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

     bool visible_accept = true;
       bool visible_order = false;
     final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('orders');
 final userId = FirebaseAuth.instance.currentUser?.phoneNumber;

  // Stream documents where the 'status' field is equal to 'active'
  Stream<QuerySnapshot> streamOrders() {
    return userCollection.where(Filter.or(Filter('status', isEqualTo:  'Pending'),Filter("maid_id", isEqualTo: '${userId}')
) ).snapshots();
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
        if (snapshot.hasError) {
           print("Error: ${snapshot.error}");
          return Text('Something went wrong');
        }


        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        Gap(40);
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          if (data['maid_id']=='${userId}'){
            visible_accept =false;
            visible_order=true;
          } else {
            visible_accept =true;
            visible_order=false;
          }
            return Container(
              
              width: 50,
              margin: EdgeInsets.symmetric(horizontal: 20,),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                title: Row(
                  children: [
                    Text(data['category']),SizedBox(width: 50,)
                    ,Visibility(
                      visible: visible_accept,
                      child: ElevatedButton(onPressed:  ()async{
                       
                                  await  userCollection.doc('${data['id']}').update({
                                   'status':'In Progress',
                                  'maid_id':userId,
                      });
                                     
                                 
                             
                      
                      }, child: Text('Accept')),
                    ),Visibility(
                      visible: visible_order,
                      child: ElevatedButton(onPressed:  ()async{               
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderView(customerid: data['userid'], orderID: data['id']),
              ),
            );                   
                             
                      
                      }, child: Text('View')),
                    )
                  ],
                ),
                subtitle: Text(data['status']),
              ),
            );
          }).toList(),
        );
      },
    ));
  }
}