import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final String url;

  const WebButton({
    Key? key,
    required this.label,
    required this.imagePath,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      child: Row(
        children: [
          ImageIcon(AssetImage(imagePath)),
          Container(
            margin: const EdgeInsets.only(left: 6),
            child: Text(label),
          ),
        ],
      ),
      onPressed: () async {
        await launch(url);
      },
    );
  }
}
