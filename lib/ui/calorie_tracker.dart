import 'package:fitness_app/helper/text_styles.dart';
import 'package:flutter/material.dart';

class Calorie extends StatelessWidget {
  const Calorie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Calorie Tracker",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          "Disciplinary Eating Habits",
          style: TextStyle(
            color: Colors.white24,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 45,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
             Text(
              "Recommended Calorie:",
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 25,
              ),
            ),
             Text(
              "9000",
              style: TextStyle(
                color: Colors.green,
                fontSize: 26,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Foods",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white24,
                    hintText: "search",
                    icon: const Icon(Icons.search),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18))),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
         Text(
          "1.Foods     -      200kcals",
          style: normalTextStyle.copyWith(),
        ),
        const SizedBox(
          height: 20,
        ),
         Text(
          "1.Foods     -      200kcals",
          style: normalTextStyle.copyWith(),
        ),
        const SizedBox(
          height: 20,
        ),
         Text(
          "1.Foods     -      200kcals",
          style: normalTextStyle.copyWith()
        ),
      ],
    ));
  }
}