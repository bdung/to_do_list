import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_list/screens/components/item_task.dart';
import 'package:to_do_list/utils/appbar_home_search_all_add.dart';

import '../constant.dart';
import '../utils/appbar_calendar.dart';
import '../utils/bottomnavigatorbar.dart';
import 'components/calendar_months.dart';
import 'components/calendar_weeks.dart';
import 'components/item_date_create_new_task.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  String _selected= 'Week';

  void selectCalendar(String select){
    setState(() {
      _selected= select;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppbarCalendar(onPressed: selectCalendar,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _selected == 'Week'
              ? CalendarWeeks()
              : CalendarMonths(),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding/2),
            child: ItemDateCreateNewTask(date: 'Today'),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ItemTask();
                },
              ),
            ),
          )

        ],
      ),
      bottomNavigationBar: BottomNavigatorBarTodolist(initIndex: 1,),
    );
  }
}
