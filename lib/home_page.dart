import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/avatar.dart';
import 'package:website/menu_drawer.dart';
import 'package:website/web_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final bool narrow = MediaQuery.of(context).size.width < 875;

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
        title: Row(
          children: [
            if (!narrow)
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Avatar(),
              ),
            Text(
              'Christopher J. Stehno',
              style: GoogleFonts.neucha(fontSize: 32),
            )
          ],
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
      bottomSheet: Container(
        width: double.infinity,
        color: Colors.grey,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('Copyright ©️ 2022 Christopher J. Stehno'),
            DonationButton()
          ],
        ),
      ),
    );
  }
}

class DonationButton extends StatelessWidget {
  const DonationButton({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.black),
        backgroundColor: MaterialStateProperty.all(Colors.amber),
      ),
      child: Row(
        children: [
          const ImageIcon(AssetImage('assets/images/paypal.png')),
          Container(
            margin: const EdgeInsets.only(left: 6),
            child: const Text('Buy me a coffee?'),
          ),
        ],
      ),
      onPressed: () async {
        await launch(
            'https://www.paypal.com/donate/?hosted_button_id=JA246LUCNUDHC');
      },
    );
  }
}
