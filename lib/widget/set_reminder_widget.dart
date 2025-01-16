import 'package:flutter/material.dart';

class SetReminderWidget extends StatelessWidget {
  const SetReminderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            border: Border.all(width: 1.0, color: Colors.black26)),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Set Reminder",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 20.0),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(Icons.notifications_rounded)
          ],
        ),
      ),
    );
  }
}