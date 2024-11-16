import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BesinDeger extends StatelessWidget {
  final String makro;
  final int deger;
  const BesinDeger({super.key,required this.makro,required this.deger});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 120,
      height: 88,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 1.4,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                makro,
                style: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.5,
                ),
              ),
              const SizedBox(height: 0.5),
              Padding(
                padding: const EdgeInsets.only(left: 0.6),
                child: Text(
                  deger.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 14, 16, 41),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
