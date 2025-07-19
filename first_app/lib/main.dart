import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Color(0xffF8FE11)),
                        Text(
                          "Nader",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 254, 253),
                          ),
                        ),
                        const Icon(Icons.star, color: Color(0xffF8FE11)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 224, 6, 6),
                        ),
                        const Text(
                          "Flutter Developer",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xffF8FE11),
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 224, 6, 6),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        _buildSocialButton(
                          "WhatsApp",
                          Icons.message,
                          "https://wa.me/201157631261",
                          context,
                        ),
                        const SizedBox(height: 20),
                        _buildSocialButton(
                          "LinkedIn",
                          Icons.link,
                          "https://www.linkedin.com/in/nader-elsayed-1b148029b?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BnfSzFXiHR82%2FONZd9uRukg%3D%3D",
                          context,
                        ),
                        const SizedBox(height: 20),
                        _buildSocialButton(
                          "GitHub",
                          Icons.code,
                          "https://github.com/Nader-Elsayed-Hassan",
                          context,
                        ),
                        const SizedBox(height: 20),
                        _buildSocialButton(
                          "Instagram",
                          Icons.camera_alt,
                          "https://www.instagram.com/nader_elsayed_hassan/profilecard/?igsh=azNsczVuZTZhZDNo",
                          context,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    String text,
    IconData icon,
    String url,
    BuildContext context,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF8FE11),
        ),
        onPressed: () async {
          final Uri uri = Uri.parse(url);

          const LaunchMode mode = LaunchMode.externalApplication;

          final success = await launchUrl(uri, mode: mode);
          if (!success) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Could not launch $text")));
          }
        },
        icon: Icon(icon, color: const Color(0xff141414)),
        label: Text(
          text,
          style: const TextStyle(color: Color(0xff141414), fontSize: 20),
        ),
      ),
    );
  }
}
