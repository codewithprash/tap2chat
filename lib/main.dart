import 'package:flutter/foundation.dart';
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
      title: 'Tap2chat',
      theme: ThemeData(
        primaryColorDark: const Color(0xFF075e54),
        brightness: Brightness.dark,
      ),
      home: const Dash(title: 'Tap2Chat'),
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
        backgroundColor: const Color(0xFF075e54),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('WHATSAPP NUMBER'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _mobnum,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF075e54)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: const Icon(
                      Icons.numbers_rounded,
                    ),
                    hintText: 'Enter mobile number',
                    filled: true),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
            ),
            GestureDetector(
              onTap: () async {
                String num = _mobnum.text.trim();
                if (kDebugMode) {
                  print(num);
                }
                String url =
                    'https://api.whatsapp.com/send/?phone=91$num&text=Hi&type=phone_number&app_absent=0';

                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                }
              },
              child: Container(
                margin: const EdgeInsets.all(80),
                height: 50,
                decoration: const BoxDecoration(
                    color: Color(0xFF075e54),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Center(child: Text("Tap to Chat")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
