import 'package:flutter/material.dart';

class DialogDueDate extends StatefulWidget {
  const DialogDueDate({super.key});

  @override
  State<DialogDueDate> createState() => _DialogDueDateState();
}

class _DialogDueDateState extends State<DialogDueDate> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            // get user input

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     ElevatedButton.icon(
            //         onPressed: () async{
            //           TimeOfDay? t = await showTimePicker(
            //               context: context,
            //               initialTime: TimeOfDay(hour: 0, minute: 0));
            //           if(t == null) return;
            //           DateTime? newDate = await showDatePicker(
            //               context: context,
            //               firstDate: DateTime(1900),
            //               lastDate: DateTime(2100));
            //
            //           /*CANCEl*/
            //           if(newDate == null) return;
            //           print(newDate);
            //           print(t!.hour);
            //         },
            //         icon: Icon(Icons.access_time),
            //         label: Text('Set Time')
            //     ),
            //   ],
            // ),
            Text('hlo')
            // buttons -> save + cancel
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     // cancel button
            //     MyButton(text: "Cancel", onPressed: (){}),
            //
            //     const SizedBox(width: 8),
            //
            //     // save button
            //     MyButton(text: "Save", onPressed: onSave),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
