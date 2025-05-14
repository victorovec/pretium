import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 25),
      child: SizedBox(
        height: 50,
        child: Center(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor:Color(0xFF15645e) ,
            foregroundColor: Color(0xFFFFFFFF),
            shape: CircleBorder(),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Icon(Icons.qr_code_2, size: 30),
            ),
          ),
        ),
      ),
    );
  }
  }
