import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';


class Scanner1 extends StatefulWidget {
  const Scanner1({super.key});

  @override
  State<Scanner1> createState() => _Scanner1State();
}

class _Scanner1State extends State<Scanner1> {
   late ImagePicker _imagePicker;
  XFile? _pickedImage;
  List<dynamic>? _recognitions1;
  bool _isLoading = false;
  
 

  @override
  void initState() {
    super.initState();
    _initializeTflite();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImageFromGallery() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
  }

  Future<void> _pickImageFromCamera() async{
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.camera);
  }

  Future<void> _initializeTflite() async {
    // Load the model and labels
    await Tflite.loadModel(
      model: "assets/bokchoymodel.tflite",
      labels: "assets/petchay_labels.txt",
      numThreads: 1, // defaults to 1
      isAsset: true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
          const Text(
            "Scan/Upload Seeds Here",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),       
          Image.asset(
              'assets/images/uploading.gif', // Path to your GIF image
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), 

            ElevatedButton.icon(
              onPressed: _pickImageFromCamera,
              label: const Text("Take a Picture",
                style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  padding: WidgetStateProperty.all(
                    const  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
             )
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: _pickImageFromGallery,
               label: const Text("Pick From Gallery",
               style: TextStyle(color: Colors.black)),
               style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                )
               ),
              )



         ],
      ),

    );
  }
}