import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomAppButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style:ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            minimumSize: Size(double.infinity, 60),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12)
            )
        ),
        onPressed: onPressed, child: Text(title,style:
    TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    )
    );
  }
}
