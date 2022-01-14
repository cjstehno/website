import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/menu_drawer.dart';
import 'package:website/web_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final bool narrow = MediaQuery.of(context).size.width < 800;

    const List<Widget> buttons = [
      WebButton(
        label: 'GitHub',
        imagePath: 'assets/images/github.png',
        url: 'https://github.com/cjstehno',
      ),
      WebButton(
        label: 'StackOverflow',
        imagePath: 'assets/images/stack-overflow.png',
        url: 'https://stackoverflow.com/users/135294/cjstehno',
      ),
      WebButton(
        label: 'GooglePlay',
        imagePath: 'assets/images/android-logo.png',
        url: 'https://play.google.com/store/apps/dev?id=6377487208969975676',
      ),
      WebButton(
        label: "DM's Guild",
        imagePath: 'assets/images/icosahedron.png',
        url:
            'https://www.dmsguild.com/browse.php?author=Christopher%20J.%20Stehno',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Christopher J. Stehno',
          style: GoogleFonts.neucha(fontSize: 32),
        ),
        actions: !narrow ? buttons : [],
      ),
      drawer: narrow ? const MenuDrawer() : null,
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
                      )),
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
