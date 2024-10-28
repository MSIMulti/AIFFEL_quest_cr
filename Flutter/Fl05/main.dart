import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JellyfishClassifier extends StatefulWidget {
  @override
  _JellyfishClassifierState createState() => _JellyfishClassifierState();
}

class _JellyfishClassifierState extends State<JellyfishClassifier> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _predictClass() async {
    if (_image == null) return;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:8000/predict_class/'),
    );
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
    var response = await request.send();
    var responseData = await http.Response.fromStream(response);
    var decodedData = json.decode(responseData.body);
    print('예측 클래스: ${decodedData['predicted_class']}');
  }

  Future<void> _predictProbability() async {
    if (_image == null) return;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:8000/predict_probability/'),
    );
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
    var response = await request.send();
    var responseData = await http.Response.fromStream(response);
    var decodedData = json.decode(responseData.body);
    print('예측 확률: ${decodedData['prediction_probability']}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jellyfish Classifier'),
        leading: Icon(Icons.ac_unit), // 해파리 아이콘 대신 임시 아이콘
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          _image == null
              ? Text('이미지가 선택되지 않았습니다.')
              : Image.file(_image!, width: 300, height: 300),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _predictClass,
                child: Text('예측 클래스'),
              ),
              ElevatedButton(
                onPressed: _predictProbability,
                child: Text('예측 확률'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: Icon(Icons.image),
      ),
    );
  }
}
