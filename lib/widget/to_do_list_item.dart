import 'package:flutter/material.dart';

class ToDoListItem extends StatefulWidget {
  const ToDoListItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<ToDoListItem> createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: widget.index.isEven ? Colors.blue : Colors.white,
              border: Border.all(color: Colors.blueAccent, width: 3.0),
              borderRadius: BorderRadius.circular(50.0)),
          width: 45.0,
          height: 45.0,
          child: Visibility(
            visible: widget.index.isEven,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Return library books",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "Gather overdue library books and return overdue Gather overdue library books overdue and return Gather overdue library books and return",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 12.0,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "11:30 AM",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 12.0,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "14/01/2025",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(
                    Icons.notification_important_rounded,
                    size: 12.0,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.loop_rounded,
                    size: 12.0,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
