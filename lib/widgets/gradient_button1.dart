import 'package:flutter/material.dart';

class GradientButton1 extends StatelessWidget {
  final Function onpressed;
  const GradientButton1({required this.onpressed, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        onpressed();
      },
      child: Container(
        width: width,
        height: 50,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orangeAccent, Colors.yellowAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Center(
          child: Text(
            'NEXT',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
