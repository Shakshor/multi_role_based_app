import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  // states
  final String title;
  final IconData icon;
  final VoidCallback onClick;

  const CustomButton({Key? key, required this.title, required this.icon, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 200,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Text(title),
            Icon(icon)
          ],
        ),
      ),
    );
  }
}

