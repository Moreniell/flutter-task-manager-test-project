import 'package:flutter/material.dart';

class TaskDetailScreen extends StatefulWidget {
  String title;

  TaskDetailScreen({
    super.key,
    required this.title,
  });

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetailScreen> {
  DateTime? _taskDeadline;
  TimeOfDay? _reminderTime;

  _selectDeadline(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _taskDeadline) {
      setState(() {
        _taskDeadline = pickedDate;
      });
    }
  }

  _selectReminderTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _reminderTime) {
      setState(() {
        _reminderTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.star), onPressed: () {/* Star action */}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const ListTile(
            title: Text('Andrew Spencer'),
            leading: CircleAvatar(
              child: Text('AS'),
            ),
          ),
          GestureDetector(
            child: ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(_taskDeadline != null ? _taskDeadline.toString() : 'Select date...'),
            ),
            onTap: () => _selectDeadline(context),
          ),
          GestureDetector(
            child: ListTile(
              leading: const Icon(Icons.alarm),
              title: Text(_reminderTime != null ? _reminderTime.toString() : 'Remind me at...'),
            ),
            onTap: () => _selectReminderTime(context),
          ),
          const ListTile(
            leading: Icon(Icons.repeat),
            title: Text('Never Repeat'),
          ),
          CheckboxListTile(
            title: const Text('Call Dr. Thomas'),
            value: false,
            onChanged: (bool? value) {
              // TODO: чекбокс
            },
          ),
          CheckboxListTile(
            title: const Text('Health insurance card'),
            value: false,
            onChanged: (bool? value) {
              // TODO: чекбокс
            },
          ),
          CheckboxListTile(
            title: const Text('X-Ray images'),
            value: false,
            onChanged: (bool? value) {
              // TODO: чекбокс
            },
          ),
          const ListTile(
            leading: Icon(Icons.add),
            title: Text('Add a Subtask'),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'The four-day event, which will bring ...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const ListTile(
            leading: CircleAvatar(child: Text('SS')),
            title: Text('Sophie Spencer'),
            subtitle: Text('But Papa! Papa, I say! Dread overcomes me, ...'),
          ),
          const ListTile(
            leading: Icon(Icons.comment),
            title: Text('Add a comment'),
          ),
        ],
      ),
    );
  }
}
