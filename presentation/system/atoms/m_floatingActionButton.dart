// necessary
import 'package:flutter/material.dart';

// pages
// import 'package:hesap/ui/screens/qr_scanner/qr_scanner_screen.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton(
      {Key? key, required this.index, required this.onChangedButton})
      : super(key: key);
  final int index;
  final ValueChanged<int> onChangedButton;

  // void _floatingActionButtonFuction() {}
  // required this.floatingActionButtonFuction, this.icon = Icons.qr_code_scanner
  @override
  State<CustomFloatingActionButton> createState() =>
      Custom_FloatingActionButton();
}

class Custom_FloatingActionButton extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return buildFloatingActionButton(index: widget.index);
  }

  Widget buildFloatingActionButton({required int index}) {
    if (index == 0) {
      return FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (context) => const QRScannerScreen()));
        },
        child: const Icon(Icons.qr_code_scanner),
      );
    } else {
      return FloatingActionButton(
        onPressed: () => widget.onChangedButton(index),
        child: const Icon(Icons.exit_to_app),
      );
    }
  }
}
