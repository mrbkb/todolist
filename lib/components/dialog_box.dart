import 'package:flutter/material.dart';
import 'package:manui/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsaved;
  VoidCallback oncancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.oncancel,
    required this.onsaved,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            //get user input
             TextField(
              controller: controller ,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new Task"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //save bottun
                MyButton(text: "save", onPressed: onsaved),
                //cancel button
                MyButton(text: "Cancel", onPressed: oncancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
