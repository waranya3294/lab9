import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _Display();
}

class _Display extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('รายงานการวัดอุณหภูมิ')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView(
              children: snapshot.data!.docs.map((document) {
            return Container(
                child: ListTile(
              leading: CircleAvatar(
                  radius: 30, child: FittedBox(child: Text(document['temp']))),
              title: Text(document['fname'] + ' ' + document['lname']),
              subtitle: Text(document['email']),
            ));
          }).toList());
        },
      ),
    );
  }
}
