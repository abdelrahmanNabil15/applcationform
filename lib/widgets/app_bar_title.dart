import 'package:flutter/material.dart';


class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/Alyou.jpg',
          height: 50,
          width: 50,
        ),
        SizedBox(width: 8),


        Container(

          child: Text(
            'Al youssef application ',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),
        ),
        Text(
          ' Form',
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}