import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // 앞 화면에서 로그인이 제대로 된 경우 여기에서도 같은 값을 가짐
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat screen'),
        actions: [
          IconButton(
            // 로그아웃
            onPressed: () {
              _authentication.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        // 데이터 가지고 있는 컬렉션 경로
        // snapshot() 해당 스트림에 데이터가 바뀔때 마다 새 벨류 값 전달
        stream: FirebaseFirestore.instance
            .collection('chats/SRH2fpqoUBPTmh11ViV3/message')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index){
              return Container(
                padding : EdgeInsets.all(8.0),
                child: Text(docs[index]['text']),
              );
            },
          );
        },
      ),
    );
  }
}
