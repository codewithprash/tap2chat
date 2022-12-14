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
      title: 'Tap2Chat',
      theme: ThemeData(
        primaryColor: const Color(0xFF128C7F),
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  final TextEditingController _mobnum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF128C7F),
        title: Text(
          "Open WhatsApp",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: _mobnum,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF128C7F)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Enter WhatsApp Number',
                  prefixText: "+91 ",
                  filled: true),
              keyboardType: TextInputType.number,
              maxLength: 10,
              textInputAction: TextInputAction.done,
            ),
          ),
          const SizedBox(
            height: 30,
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
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: const StadiumBorder(),
            ),
            child: const Text("Continue to Chat"),
          ),
        ],
      ),
    );
  }
}




// class Dash extends StatefulWidget {
//   const Dash({super.key, required this.title});
//   final String title;

//   @override
//   State<Dash> createState() => _DashState();
// }

// class _DashState extends State<Dash> {
//   final TextEditingController _mobnum = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0xFF128C7F),
//         title: Text(
//           widget.title,
//           style: Theme.of(context).textTheme.headline4,
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(40.0),
//               child: Text(
//                 'Send WhatsApp messages without saving phone number',
//                 style: Theme.of(context).textTheme.headline6,
//                 overflow: TextOverflow.visible,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: TextField(
//                 controller: _mobnum,
//                 decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(color: Color(0xFF128C7F)),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     hintText: 'Enter WhatsApp Number',
//                     prefixText: "+91",
//                     filled: true),
//                 keyboardType: TextInputType.number,
//                 textInputAction: TextInputAction.done,
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 String num = _mobnum.text.trim();

//                 String url =
//                     'https://api.whatsapp.com/send/?phone=91$num&text=Hi';

//                 if (await canLaunchUrlString(url)) {
//                   await launchUrlString(url);
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF128C7F),
//                 textStyle: const TextStyle(fontSize: 16),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                 shape: const StadiumBorder(),
//               ),
//               child: const Text("Continue to Chat"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
