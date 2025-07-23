import 'package:flutter/material.dart';

class google_signIn_page extends StatelessWidget {
  const google_signIn_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141414),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8FE11),
        title: const Center(child: Text('Communication App')),
        leading: const Icon(Icons.message),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double avatarSize = constraints.maxWidth * 0.6;
                      if (avatarSize > 300) avatarSize = 300;
                      return CircleAvatar(
                        radius: avatarSize / 2,
                        backgroundImage: const AssetImage("assets/ndr.JPG"),
                        backgroundColor: Colors.transparent,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  FittedBox(
                    child: Text(
                      "Welcome to the Google Sign-In Page",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      labelStyle: TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white24,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(249, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text("Go Back"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
