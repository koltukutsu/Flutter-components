// necessary
import 'package:flutter/material.dart';

class MImageCard extends StatelessWidget {
  const MImageCard(
      {Key? key,
      required this.onChangedTab,
      this.text = "Hesap Coffe",
      this.imageUrl =
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F44%2F2019%2F08%2F26230801%2F4549578.jpg"})
      : super(key: key);
  final ValueChanged<int> onChangedTab;
  final String imageUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: NetworkImage(imageUrl),
            height: 99,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {
                _returnButton(context);
              },
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _returnButton(BuildContext context) async {
    final int result = await
        // Navigator.push(context,
        // MaterialPageRoute(builder: (context) => PopUpEkran(text: text)));
        onChangedTab(result);
  }
}
