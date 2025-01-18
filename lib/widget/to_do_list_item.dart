import 'package:flutter/material.dart';

import '../to_do_model.dart';

class ToDoListItem extends StatefulWidget {
  const ToDoListItem({
    super.key,
    required this.index,
    required this.item,
  });

  final int index;
  final ToDoModel item;

  @override
  State<ToDoListItem> createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem> {
  @override
  void initState() {
    super.initState();

    widget.item.createdDate.hour;
  }

  int convertTime() {
    if (widget.item.createdDate.hour > 12) {
      return widget.item.createdDate.hour - 12;
    } else {
      return widget.item.createdDate.hour;
    }
  }

  String getAmPm(){
    if (widget.item.createdDate.hour >= 12) {
      return "PM";
    } else {
      return "AM";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: widget.item.isTaskCompleted ? Colors.blue : Colors.white,
              border: Border.all(color: Colors.blueAccent, width: 3.0),
              borderRadius: BorderRadius.circular(50.0)),
          width: 45.0,
          height: 45.0,
          child: Visibility(
            visible: widget.item.isTaskCompleted,
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.item.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w500),
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
                    "${convertTime()}:${widget.item.createdDate.minute} ${getAmPm()}",
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
                    "${widget.item.createdDate.day}/${widget.item.createdDate.month}/${widget.item.createdDate.year}",
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
