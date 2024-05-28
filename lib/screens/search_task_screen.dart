import 'package:flutter/material.dart';

import '../constant.dart';
import '../utils/appbar_home_search_all_add.dart';
import '../utils/bottomnavigatorbar.dart';
import 'components/item_task.dart';
import 'components/search_bar.dart';


class SearchTaskScreen extends StatefulWidget {
  const SearchTaskScreen({super.key});

  @override
  State<SearchTaskScreen> createState() => _SearchTaskScreenState();
}

class _SearchTaskScreenState extends State<SearchTaskScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHomeSearchAllAddTask(
        canBack: true,
        title: 'Search Task',
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding/2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarComponent(
              controller: _controller,
              onChange: () {},
              placeholder: 'Search for Tasks, Events',
            ),
            Text(
              'Result',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
              )
            ),
            SizedBox(height: kDefaultPadding/2,),

            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder:(context, index){
                    return ItemTask();
                  }),
            )
          ],
        ),
      ),
    );;
  }
}
