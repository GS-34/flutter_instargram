import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountPage extends StatefulWidget {
  final User _user;

  const AccountPage(this._user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _postCount = 0;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('post')
        .where('email', isEqualTo: widget._user.email)
        .get()
        .then((snapshot) => {setState(() {
          _postCount = snapshot.docs.length;
    })});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app))
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget._user.photoURL!),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.bottomRight,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.white,
                                child: Icon(Icons.add),
                              ),
                            ),
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(3)),
              Text(
                widget._user.displayName!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
          Text(
            '$_postCount\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '0\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '0\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
