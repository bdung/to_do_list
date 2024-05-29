import 'package:flutter/material.dart';

import '../../constant.dart';
import '../add_task_screen.dart';

class ItemDateCreateNewTask extends StatelessWidget {
  final String date;

  const ItemDateCreateNewTask({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          date,
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: kPrimaryColor),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              border: Border.all(
                  color: kBorderButtonColor
              ),
              shape: BoxShape.circle
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddTaskScreen()));
            },
            icon: const Icon(
              Icons.add,
              color: kBorderButtonColor,
            ),
            iconSize: 12,
          ),
        )
      ],
    );
  }
}
