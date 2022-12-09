import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap 2 chat',
      theme: ThemeData(
        primaryColor: const Color(0xFF075e54),
        primarySwatch: Colors.green,
      ),
      home: const Dash(title: 'OnTap'),
    );
  }
}

class Dash extends StatefulWidget {
  const Dash({super.key, required this.title});
  final String title;

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  final TextEditingController _mobnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF128C7F),
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                'Send WhatsApp messages without saving phone number',
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.visible,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: _mobnum,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF128C7F)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: const Icon(
                      Icons.numbers_rounded,
                    ),
                    hintText: 'Enter WhatsApp Number',
                    filled: true),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String num = _mobnum.text.trim();

                String url =
                    'https://api.whatsapp.com/send/?phone=91$num&text=Hi';

                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF128C7F),
                textStyle: const TextStyle(fontSize: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: const StadiumBorder(),
              ),
              child: const Text("Continue to Chat"),
            ),
          ],
        ),
      ),
    );
  }
}

// GestureDetector(
            //   onTap: () async {
            //     String num = _mobnum.text.trim();

            //     String url =
            //         'https://api.whatsapp.com/send/?phone=91$num&text=Hi';

            //     if (await canLaunchUrlString(url)) {
            //       await launchUrlString(url);
            //     }
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.all(80),
            //     height: 50,
            //     decoration: const BoxDecoration(
            //         color: Color(0xFF075e54),
            //         borderRadius: BorderRadius.all(Radius.circular(30))),
            //     child: const Center(child: Text("Tap to Chat")),
            //   ),
            // ),
