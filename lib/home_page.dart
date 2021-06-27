import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User _user;
  const HomePage(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instargram Clone',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Instargram에 오신 것을 환영합니다',
                  style: TextStyle(fontSize: 24.0),
                ),
                Padding(padding: EdgeInsets.all(8),),
                Text(
                  '사진과 동영상을 보려면 팔로우하세요.',
                  style: TextStyle(fontSize: 8.0),
                ),
                Padding(padding: EdgeInsets.all(8),),
                SizedBox(
                  width: 260,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(8)),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://engineering.linecorp.com/wp-content/uploads/2019/08/flutter1.png'
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Text(_user.email!, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(_user.displayName!),
                          Padding(padding: EdgeInsets.all(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                  'https://ichef.bbci.co.uk/news/640/cpsprodpb/69F0/production/_110002172_168.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(1)),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                  'https://ichef.bbci.co.uk/news/640/cpsprodpb/69F0/production/_110002172_168.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(1)),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                  'https://ichef.bbci.co.uk/news/640/cpsprodpb/69F0/production/_110002172_168.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          Text('Facebook 친구'),
                          Padding(padding: EdgeInsets.all(4)),
                          RaisedButton(
                              child: Text('팔로우'),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {

                              }),
                          Padding(padding: EdgeInsets.all(4)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



}
