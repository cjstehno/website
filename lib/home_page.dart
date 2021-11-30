import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Christopher J. Stehno',
          style: GoogleFonts.neucha(
            fontSize: 32,
          ),
        ),
        actions: [
          ElevatedButton(
            child: Row(
              children: [
                const ImageIcon(AssetImage('assets/images/github.png')),
                Container(
                  margin: const EdgeInsets.only(left: 6),
                  child: const Text('GitHub'),
                ),
              ],
            ),
            onPressed: () async {
              await launch('https://github.com/cjstehno');
            },
          ),
          ElevatedButton(
            child: Row(
              children: [
                const ImageIcon(AssetImage('assets/images/stack-overflow.png')),
                Container(
                  margin: const EdgeInsets.only(left: 6),
                  child: const Text('StackOverflow'),
                ),
              ],
            ),
            onPressed: () async {
              await launch('https://stackoverflow.com/users/135294/cjstehno');
            },
          )
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FittedBox(
              child: Image.asset('assets/images/keyboard.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    )
                  ),
                  padding: const EdgeInsets.all(10),
                  width: 400,
                  child: Column(
                    children: [
                      Text(
                        'Always code as if the guy who ends up maintaining it will be a '
                        'violent psychopath who knows where you live',
                        style: GoogleFonts.neucha(
                          fontSize: 32,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: const Text(
                          '- John F. Woods',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
