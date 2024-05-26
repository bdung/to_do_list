import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../constant.dart';

class ItemTask extends StatefulWidget {
  const ItemTask({super.key});

  @override
  State<ItemTask> createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {},
            icon: Icons.delete_forever,
            foregroundColor: Colors.red,
            backgroundColor: kTextWhiteColor,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: kDefaultPadding/2, bottom: kDefaultPadding/2, left: kDefaultPadding/2, right: kDefaultPadding/2),
          decoration: BoxDecoration(
            color: kTextWhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      margin: EdgeInsets.only(right: kDefaultPadding/2),
                      child: Checkbox(
                        value: _isChecked,
                        // onChanged: onChanged,
                        activeColor: _isChecked ?kTextLightColor:Colors.black,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ?? false; // Cập nhật trạng thái của checkbox khi được thay đổi
                          });
                        },
                        shape: CircleBorder(
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Google project', style: TextStyle(color: _isChecked ?kTextLightColor:Colors.black,fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                          Text('Website !', style: TextStyle(color: _isChecked ?kTextLightColor:kTextColorDescription, fontSize: 12),maxLines: 3, overflow: TextOverflow.ellipsis,)
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
                    decoration: BoxDecoration(
                      border: Border.all(color: _isChecked ?kTextLightColor:Colors.red),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text('10:00 AM', style: TextStyle(color: _isChecked ?kTextLightColor:Colors.red, fontSize: 10),),
                  ),
                  Text('20/05/2024', style: TextStyle(color: _isChecked ?kTextLightColor:Colors.blue, fontSize: 10),)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
