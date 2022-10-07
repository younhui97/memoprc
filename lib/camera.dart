import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo',
      home: Camera(),
    );
  }
}

class Camera extends StatefulWidget {
  const Camera({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State<Camera> createState() => _Camera();
}

class _Camera extends State<Camera>{
  File userImage =File('ini');
  Future getImage() async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null){
      setState(() {
        userImage = File(image.path);
      });
    }
  }
  Future fromCamera() async{
    var picker = ImagePicker();
    var f = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      userImage=File(f!.path);
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Scaffold(
            body: Column(
              children: [
                FloatingActionButton(
                  onPressed: fromCamera,
                  child: Icon(Icons.add_a_photo),
                ),
                FloatingActionButton(
                  onPressed: getImage,
                  child: Icon(Icons.add_a_photo),
                ),
                Image.file(userImage)
              ],
            )
        )//create new widget class for t// his 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}

