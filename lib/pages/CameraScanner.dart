import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';



class CameraStream extends StatefulWidget {
  @override
  _CameraStreamState createState() => _CameraStreamState();
}

class _CameraStreamState extends State<CameraStream> {
  CameraController? _cameraController;
  late List<CameraDescription> cameras;
  bool isDetecting = false;
  String? detectionResult;
  late String res;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadModel();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[0], // Use the back camera
      ResolutionPreset.low,
    );

    await _cameraController?.initialize();
    if (!mounted) return;

    setState(() {});
    _startCameraStream();
  }

  void _startCameraStream() {
    _cameraController?.startImageStream((CameraImage image) async {
      if (!isDetecting) {
        isDetecting = true;

        // Run the machine learning model on the frame
        var result = await _detectDisease(image);

        setState(() {
          detectionResult = result;
        });

        isDetecting = false;
      }
    });
  }

  Future<void> _loadModel() async {
    res = (await Tflite.loadModel(
      model: "assets/bokchoymodel.tflite",
      labels: "assets/petchay_labels.txt",
    ))!;
    print(res);
  }

  Future<String?> _detectDisease(CameraImage image) async {
    var results = await Tflite.runModelOnFrame(
      bytesList: image.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: image.height,
      imageWidth: image.width,
      imageMean: 127.5,  // For normalization if needed
      imageStd: 127.5,   // For normalization if needed
      rotation: 90,
      numResults: 2,  // Limit number of results
      threshold: 0.3, // Detection confidence threshold
      asynch: true
    );
    print('Inference results: $results');
    if (results != null && results.isNotEmpty) {
      return results.first['label']; // Get the first result (highest confidence)
    }
    return "No disease detected";
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    Tflite.close();  // Release the model
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Pechay Disease Detection",
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 98, 218, 18),
      ),
      body: Stack(
        children: [
          CameraPreview(_cameraController!),
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                detectionResult ?? "Detecting...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
