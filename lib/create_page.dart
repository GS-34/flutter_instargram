import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePage extends StatefulWidget {
  final User _user;

  CreatePage(this._user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  TextEditingController textEditingController = TextEditingController();
  File? _image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _getImage();
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  @override
  void dispose (){
    textEditingController.dispose();
    super.dispose();
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: (){
              final task = FirebaseStorage.instance
              .ref()
              .child('post')
              .child('${DateTime.now().microsecond}.png')
                  .putFile(_image!);

              task.then((value1)=>{
                value1.ref.getDownloadURL().then((uri) => {
                  FirebaseFirestore.instance
                      .collection('post')
                      .add({
                    'photoUrl' : uri.toString(),
                    'contents' : textEditingController.text,
                    'email' : widget._user.email,
                    'displayName' : widget._user.displayName,
                    'userPhotoUrl' : widget._user.photoURL
                      }).then((value) => Navigator.pop(context))
                })
              });
            },
            icon: Icon(Icons.send))
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _image == null
              ? Text('No Image')
              : Image.file(_image!),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: '내용을 입력하세요.'
            ),
          )
        ],
      ),
    );
  }

  void _getImage() async {
    PickedFile? image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

}
