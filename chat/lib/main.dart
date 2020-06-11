import 'package:chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

main() async {
  runApp(MyApp());
//  Firestore.instance.collection("mensagens").document().setData({
//    'texto': 'vem almoçar ?',
//    'from': 'Gui',
//    'read': false
//  });

//  QuerySnapshot snapshot = await Firestore.instance.collection("mensagens").getDocuments();
//  snapshot.documents.forEach((element) {
//    print(element.data);
//    print(element.documentID);
//  });

//  DocumentSnapshot snapshot = await Firestore.instance.collection("mensagens").document("6CBNWugGgBrB1qhVz0hr").get();
//  print(snapshot.data);

//   Firestore.instance.collection("mensagens").snapshots().listen((dado) {
//     dado.documents.forEach((element) {
//       print(element.data);
//     });
//   });

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        home: ChatScreen(),
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.blue
        )
      ),
    );
  }
}
