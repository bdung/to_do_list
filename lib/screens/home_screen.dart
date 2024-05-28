import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';
import '../utils/appbar_home_search_all_add.dart';
import '../utils/bottomnavigatorbar.dart';
import 'components/item_date_create_new_task.dart';
import 'components/item_task.dart';
import 'components/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHomeSearchAllAddTask(
        canBack: false,
        title: 'Home',
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
            ItemDateCreateNewTask(date: 'Today',),
            SizedBox(height: kDefaultPadding,),

            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder:(context, index){
                    return ItemTask();
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigatorBarTodolist(
        initIndex: 0,
      ),
    );
  }
}
