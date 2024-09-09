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
                      "My Personal Information",
                      style: TextStyle(fontSize: 40,),
                    ),
                    //Profile Picture
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage('assets/images/uploading.gif'),
                  ),
                  //Name
                  const SizedBox(height: 20),
                  const Text(
                    "Name:",
                    style:  TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Juan DelaCruz",
                    style: TextStyle(fontSize: 25),
                  ),
                  //Age
                  const SizedBox(height: 20),
                  const Text(
                    "Age:",
                    style:  TextStyle(fontSize: 20),
                  ),
                  Text(
                    "26",
                    style: TextStyle(fontSize: 25),
                  ),
                  //Address
                  const SizedBox(height: 20),
                  const Text(
                    "Address:",
                    style:  TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Tacloban City",
                    style: TextStyle(fontSize: 25),
                  ),
                  //Expert Level
                  const SizedBox(height: 20),
                  const Text(
                    "Expert Level:",
                    style:  TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Beginner",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}