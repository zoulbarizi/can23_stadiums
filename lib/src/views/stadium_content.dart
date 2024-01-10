import 'package:can23_stadiums/src/utils/consts.dart';
import 'package:flutter/material.dart';

import '../models/stadium.dart';

class StadiumContent extends StatelessWidget {
  final Stadium stadium;
  const StadiumContent(this.stadium, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 8)
          .add(const EdgeInsets.only(top: 50)),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            offset: Offset(1, 23),
          ),
        ],
        // borderRadius: BorderRadius.vertical(
        //   top: Radius.circular(32),
        // ),
        // color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Colors.white.withOpacity(.9),
            // Colors.white.withOpacity(.01),
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white.withOpacity(.6),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(32.0),
          //   child: ClipRRect(
          //     borderRadius: const BorderRadius.all(
          //       Radius.circular(16),
          //     ),
          //     child: Image.network(
          //       stadium.image,
          //       height: 200,
          //       width: double.infinity,
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Text(
            stadium.name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Divider(color: Consts.color2, thickness: 1),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on_outlined),
              Text(
                stadium.location,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(color: Consts.color3, thickness: 1),
          Text(
            "${stadium.capacity} places",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
