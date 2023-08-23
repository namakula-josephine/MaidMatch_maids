import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class GetOrderDetails extends StatelessWidget {
  final String documentId;

  GetOrderDetails(this.documentId);
 

      bool visible_cancel = true;
       bool visible_complete = true;
  @override
  Widget build(BuildContext context) {
    CollectionReference orders = FirebaseFirestore.instance.collection('orders');

    return FutureBuilder<DocumentSnapshot>(
      future: orders.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
           final startdate =DateFormat('yyyy-MM-dd').format(data['date'].toDate().toLocal()).toString();
           if (data['status']=='In Progress'){
            visible_cancel =true;
            visible_complete=true;
           }else{
             visible_cancel =false;
            visible_complete=false;
           }
          return Column(
            children: [
              Row(
                children: [Text("Category:"),
                  Text("${data['category']} "),
                ],
              ), Row(
                children: [Text("Start Date:"),
                  Text("${startdate } "),
                ],
              ),
              Row(
                children: [Text("Status:"),
                  Text("${data['status']}  "),
                ],
              ),Visibility(
                visible: visible_cancel,
                child: ElevatedButton(onPressed: () async{
                             await  orders.doc(documentId).update({
                                   'status':'Pending',
                                 'maid_id':'',
                      });
                           
              }, child: Text('Cancel Order'))),
              Visibility(
                visible: visible_complete,
                child: ElevatedButton(onPressed: () async{
                          await  orders.doc(documentId).update({
                                   'status':'Complete',
                                
                      });
              }, child: Text('Complete')))
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}



class OrderView extends StatefulWidget {
  final String customerid;
  final String orderID;

  OrderView({required this.customerid, required this.orderID});

  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
    
   Stream<QuerySnapshot> streamOrder() {
    return FirebaseFirestore.instance.collection('users').where('uid', isEqualTo:  '${widget.customerid}').snapshots(includeMetadataChanges: true);
  }   
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
      stream: streamOrder(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          
               
     
            return Column(
              children: [
                ListTile(
                  title: Column(
                    children: [
                     
                       Center(
        child: CircleAvatar(
          radius: 80, // Adjust the size as needed
          backgroundImage: Image.network(data['profilePic']??"https://cdn.vectorstock.com/i/preview-1x/66/14/default-avatar-photo-placeholder-profile-picture-vector-21806614.jpg").image,
        ),
      ), Row(
        children: [
          Text('Customer Name:'),SizedBox(width: 10,),Text(data['name']??"")
        ],
      ), Row(
        children: [
          Text('Phone Number:'),SizedBox(width: 10,),Text(data['uid']??"")
        ],
      ),
                    ],
                  ),
                  subtitle: Text(data['email']??""),
                ),GetOrderDetails(widget.orderID)
              ],
            );
          }).toList(),
        );
      },
    ));
  }
}