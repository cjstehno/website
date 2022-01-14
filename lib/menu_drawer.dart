import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/store-dev-icon.jpg'),
                  width: 40,
                ),
                Container(
                  child: const Text('My Projects'),
                  margin: const EdgeInsets.only(left: 8),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          const DrawerButton(
            label: 'GitHub',
            imagePath: 'assets/images/github.png',
            url: 'https://github.com/cjstehno',
          ),
          const Divider(),
          const DrawerButton(
            label: 'StackOverflow',
            imagePath: 'assets/images/stack-overflow.png',
            url: 'https://stackoverflow.com/users/135294/cjstehno',
          ),
          const Divider(),
          const DrawerButton(
            label: 'GooglePlay',
            imagePath: 'assets/images/android-logo.png',
            url:
                'https://play.google.com/store/apps/dev?id=6377487208969975676',
          ),
          const Divider(),
          const DrawerButton(
            label: "DM's Guild",
            imagePath: 'assets/images/icosahedron.png',
            url:
                'https://www.dmsguild.com/browse.php?author=Christopher%20J.%20Stehno',
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final String url;

  const DrawerButton({
    required this.label,
    required this.imagePath,
    required this.url,
  });

  @override
  Widget build(final BuildContext context) {
    return ListTile(
      leading: ImageIcon(AssetImage(imagePath)),
      title: Text(
        label,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: () async {
        await launch(url);
      },
    );
  }
}
