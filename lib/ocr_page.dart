import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';

class OCRPage extends StatefulWidget {
  @override
  _OCRPageState createState() => _OCRPageState();
}
class _OCRPageState extends State<OCRPage> {
int _ocrCamera = FlutterMobileVision.CAMERA_BACK;
String _text = "";

@override
  void initState() {
    _read();
    // TODO: implement initState
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Ler o número'),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_text,style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                ),
                Center(
                  child: RaisedButton(
                   onPressed: _read,
                   child: Text('Iniciar',
                     style: TextStyle(fontSize: 16),
                   ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _ocrCamera,
        waitTap: true,
      );
      setState(() {
          Navigator.pushReplacementNamed(context, "/insert_boleto", arguments: texts[0].value);
      });
    } on Exception {
      texts.add( OcrText('Failed to recognize text'));
    }
  }
}