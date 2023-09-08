import 'package:flutter/material.dart';
import 'package:profile/screens/web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final  WebViewController controller;
  @override
void initState() {
    controller = WebViewController()..loadRequest(Uri.parse('https://github.com/lottin'),);
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(

            padding: const EdgeInsets.symmetric(vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage('image/ramish.png'),
                ),
                const SizedBox(height: 16,),
                RichText(text: const TextSpan(
                  text: 'Slack Name',
                  style: TextStyle(
                    fontWeight:FontWeight.normal,
                    fontSize: 18,
                    color: Colors.black
                  ),
                  children: <TextSpan> [
                    TextSpan(text: '  Ramish Benoit', style:
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      fontSize: 18
                    ),)
                  ]
                ),),
                const SizedBox(height: 64,),
                ElevatedButton(onPressed: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => WebViewScreen(controller: controller) )
                   );
                }, child: const Text('Open GitHub'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
