import 'package:flutter/material.dart';
import 'package:plandora/ui/screens/task_detail_screen.dart';

class Task extends StatefulWidget {
  String title;
  DateTime? deadline;
  bool isChecked;
  bool isStarred;

  Task({
    Key? key,
    required this.title,
    this.deadline,
    this.isChecked = false,
    this.isStarred = false,
  }): super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            title: Text(widget.title),
            subtitle:
            widget.deadline != null ? Text(widget.deadline.toString()) : null,
            leading: Checkbox(
              value: widget.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.isChecked = !widget.isChecked;
                });
              },
            ),
            trailing: GestureDetector(
              child: Icon(
                  widget.isStarred ? Icons.star : Icons.star_border,
                  color: widget.isStarred ? Colors.yellow : Colors.grey
              ),
              onTap: () {
                setState(() {
                  widget.isStarred = !widget.isStarred;
                });
              },
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailScreen(title: widget.title),
            ),
          );
        },
      );
  }
}
