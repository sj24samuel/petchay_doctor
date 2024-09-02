import 'package:flutter/material.dart';

class Profileuser extends StatefulWidget {
  const Profileuser({super.key});

  @override
  State<Profileuser> createState() => _ProfileuserState();
}

class _ProfileuserState extends State<Profileuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Proflie"),
        ),
        body: SingleChildScrollView(
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                      "Profile Information",
                      style: TextStyle(fontSize: 20),
                    ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/uploading.gif', // Path to your GIF image
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}