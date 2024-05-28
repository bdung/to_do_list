import 'package:flutter/material.dart';

import '../constant.dart';

class AppbarHomeSearchAllAddTask extends StatelessWidget
    implements PreferredSizeWidget {
  final bool canBack;
  final String title;
  final bool? isEdit;

  const AppbarHomeSearchAllAddTask(
      {super.key, required this.canBack, required this.title, this.isEdit});

  // final

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment:
            canBack ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        children: [
          canBack
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : const SizedBox.shrink(),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          isEdit == null
              ? const SizedBox.shrink()
              : isEdit!
                  ? Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 14,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 12,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
        ],
      ),
      backgroundColor: kTextWhiteColor,
      automaticallyImplyLeading: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
