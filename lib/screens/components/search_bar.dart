import 'package:flutter/material.dart';
import 'package:to_do_list/constant.dart';

import '../search_task_screen.dart';

class SearchBarComponent extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final VoidCallback onChange;

  const SearchBarComponent({super.key, required this.controller, required this.placeholder, required this.onChange});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding*1.5),
      decoration: BoxDecoration(
        border: Border.all(),
            borderRadius: BorderRadius.circular(10),
        color: kButtonColor,
      ),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.search,
                  color: Theme.of(context).colorScheme.onSurface),
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != '/search_task_screen') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchTaskScreen(),settings: RouteSettings(name: '/search_task_screen')));
                }
              }),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: (value) {
                onChange();
              },
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(

                hintText: placeholder,
                hintStyle:
                TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
