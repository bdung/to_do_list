import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/constant.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int _selectedIndex = 0;
  int selectedOption = 1;
  List<String> listReminder = <String>['15 min', '30 min', '45 min', '1 day'];
  List<String> listRepeat = <String>['None', 'every day', 'Weekly', 'Monntly'];

  String dateChooseFromUser = "";
  DateTime _selectedDate = new DateTime.now();
  TimeOfDay _selectedTime = new TimeOfDay.now();

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      dateChooseFromUser = DateTime.now().toString();
    }
  }

  _getTimeFromUser() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: _selectedTime,
    );
    if (timeOfDay != null) {
      setState(() {
        _selectedTime = timeOfDay;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(hour: 9, minute: 10));
  }

  @override
  Widget build(BuildContext context) {
    String dropdownValue = listReminder.first;
    String repeatValue = listReminder.first;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Center(
            child: Text(
          "Add Task      ",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontFamily: kDefaultFontFamily),
        )),
        elevation: 2.0,
        backgroundColor: Colors.white,
        shadowColor: kButtonBottomColor.withOpacity(0.5),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle the action for the icon button here
            print('Settings icon pressed');
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Create",
              style:
                  TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(kDefaultPadding / 2,
              kDefaultPadding, kDefaultPadding / 2, kDefaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Title",
                style: TextStyle(
                    fontFamily: kDefaultFontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kTextColorRegular),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: kBorderButtonColor,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kBorderButtonColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Add title task',
                    filled: true,
                    fillColor: kButtonColor),
                cursorColor: kPrimaryColor,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              // add color
              const Text(
                "Color",
                style: TextStyle(
                    fontFamily: kDefaultFontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kTextColorRegular),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Row(
                children: [
                  Wrap(
                    children: List<Widget>.generate(7, (int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: index == 0
                                ? Colors.red
                                : index == 1
                                    ? Colors.cyan
                                    : index == 2
                                        ? Colors.blue
                                        : index == 3
                                            ? Colors.yellow
                                            : index == 4
                                                ? Colors.orange
                                                : index == 5
                                                    ? Colors.green
                                                    : Colors.purple,
                            child: _selectedIndex == index
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : null,
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  "Date",
                  style: TextStyle(
                      fontFamily: kDefaultFontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kTextColorRegular),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    _getDateFromUser();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.02,
                      ),
                      Text(
                        "${DateFormat.yMMMd().format(_selectedDate)}",
                        style: TextStyle(
                            fontFamily: kDefaultFontFamily,
                            fontWeight: FontWeight.w600,
                            color: kTextColorDescription),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    _getTimeFromUser();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.watch_rounded,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.02,
                      ),
                      Text(
                        "${_selectedTime.hour.toString().padLeft(2, '0')}: ${_selectedTime.minute.toString().padLeft(2, '0')} ",
                        style: TextStyle(
                            fontFamily: kDefaultFontFamily,
                            fontWeight: FontWeight.w600,
                            color: kTextColorDescription),
                      )
                    ],
                  ),
                ),
              ]),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              const Text(
                "Repeat",
                style: TextStyle(
                    fontFamily: kDefaultFontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kTextColorRegular),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              DropdownMenu(
                width: MediaQuery.sizeOf(context).width * 0.94,
                initialSelection: listRepeat.first,
                onSelected: (String? value) {
                  setState(() {
                    repeatValue = value!;
                  });
                },
                dropdownMenuEntries:
                    listRepeat.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              const Text(
                "Reminder",
                style: TextStyle(
                    fontFamily: kDefaultFontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kTextColorRegular),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding),
                child: DropdownMenu(
                  width: MediaQuery.sizeOf(context).width * 0.94,
                  initialSelection: listReminder.first,
                  onSelected: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries: listReminder
                      .map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              const Text(
                "Note",
                style: TextStyle(
                    fontFamily: kDefaultFontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kTextColorRegular),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kButtonColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kBorderButtonColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kBorderButtonColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                minLines: 5,
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
