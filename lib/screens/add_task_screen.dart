import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:to_do_list/constant.dart';
import 'package:to_do_list/utils/appbar_home_search_all_add.dart';

import 'components/dialog_due_date.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleTask = TextEditingController();
  final TextEditingController _descriptionTask = TextEditingController();
  String _selectedOption = 'None';
  late TimeOfDay? _setTime;
  late DateTime? _setDueDate;
  late int _currentValue;

  @override
  void initState() {
    _currentValue = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHomeSearchAllAddTask(canBack: true, title: 'Add Task'),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(
                  top: kDefaultPadding / 4, bottom: kDefaultPadding),
              padding: EdgeInsets.only(left: kDefaultPadding / 2),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _titleTask,
                onChanged: (value) {
                  // onChange();
                },
                style: const TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  hintText: 'Enter the task title',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSurface),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 7),
                ),
              ),
            ),
            Text(
              'Date',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding / 2),
              child: Row(
                children: [
                  MaterialColorPicker(
                    onColorChange: (Color color) {
                      // Handle color changes
                    },
                    onMainColorChange: (value) {
                      print(value);
                    },
                    circleSize: 25,
                    allowShades: false,
                    spacing: 5,
                    elevation: 1,
                    selectedColor: Colors.red,
                    colors: [
                      Colors.red,
                      Colors.cyan,
                      Colors.blueAccent,
                      Colors.yellow,
                      Colors.green,
                      Colors.purple
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'More',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kBorderButtonColor,
                            fontSize: 20),
                      ))
                ],
              ),
            ),
            Text(
              'Color',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 40,
                      height: 30,
                      child: IconButton(
                        onPressed: () async {
                          _setDueDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          color: Colors.orange,
                        ),
                        padding: EdgeInsets.only(right: kDefaultPadding),
                      )),
                  Text('Set due date')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 30,
                    child: IconButton(
                      onPressed: () async {
                        _setTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 0, minute: 0));
                      },
                      icon: Icon(
                        Icons.access_time,
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.only(right: kDefaultPadding),
                    ),
                  ),
                  Text('Set Time'),
                ],
              ),
            ),
            Text(
              'Repeat',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding / 2),
              child: Row(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      title: Text(
                        'None',
                        style: TextStyle(fontSize: 12),
                      ),
                      value: 'None',
                      visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      contentPadding: EdgeInsets.zero,
                      groupValue: _selectedOption,
                      dense: true,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      title: Text(
                        'Daily',
                        style: TextStyle(fontSize: 12),
                      ),
                      value: 'Daily',
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      title: Text(
                        'Weekly',
                        style: TextStyle(fontSize: 12),
                      ),
                      value: 'Weekly',
                      groupValue: _selectedOption,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text(
                        'Monthly',
                        style: TextStyle(fontSize: 12),
                      ),
                      value: 'Monthly',
                      groupValue: _selectedOption,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                        vertical: VisualDensity.minimumDensity,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: <Widget>[
            //     RadioListTile(
            //       title: Text('None'),
            //       value: 'None',
            //       groupValue: _selectedOption,
            //       onChanged: (value) {
            //         setState(() {
            //           _selectedOption = value!;
            //         });
            //       },
            //     ),

            //   ],
            // ),
            Text(
              'Reminder',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(bottom: kDefaultPadding),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 40,
                    child: IconButton(
                      onPressed: () {
// Ở nơi bạn muốn hiển thị AlertDialog, thêm đoạn mã sau:
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Set reminder"),
                              content: Container(
                                height: 200,
                                child: Column(
                                  children: <Widget>[
                                    NumberPicker(
                                      value: _currentValue,
                                      minValue: 0,
                                      maxValue: 60,
                                      onChanged: (value) =>
                                          setState(() => _currentValue = value),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: Colors.black26),
                                      ),
                                    ),
                                    Text( '$_currentValue Minute')
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                              MaterialButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              color: kBorderButtonColor,
                              child: Text('Select'),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            )
                              ],
                            );
                          },
                        );

                      },
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.only(right: kDefaultPadding),
                    ),
                  ),
                  Text('Set Reminder')
                ],
              ),
            ),
            Text(
              'Note',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 2),
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _descriptionTask,
                onChanged: (value) {
                  // onChange();
                },
                style: const TextStyle(fontSize: 12),
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Enter the task description',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSurface),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 7),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'CREATE TASK',
                  style: TextStyle(color: kTextWhiteColor, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  backgroundColor: kBorderButtonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
