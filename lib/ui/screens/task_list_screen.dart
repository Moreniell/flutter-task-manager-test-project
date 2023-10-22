import 'package:flutter/material.dart';
import 'package:plandora/ui/widgets/add_task_input.dart';

import '../widgets/task.dart';

class TaskListScreen extends StatelessWidget {
  final String title;

  const TaskListScreen({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.sort), onPressed: () {
            /* TODO: cортування */
          }),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {
            /* TODO: додаткові опції */
          }),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 16.0, left: 10.0, right: 10.0),
              child: AddTaskInput(onTaskAdded: (taskName) {
                // TODO: додавання задачі
              }),
            ),
            Task(title: 'Make dentist appointment', isStarred: true),
            Task(title: 'Prepare birthday party', isStarred: true),
            Task(title: 'Call Tom', deadline: DateTime(2024, 10, 23)),
            Task(title: 'Meet Erik for lunch', isStarred: true),
            Task(title: 'Clean bathroom', deadline: DateTime(2024, 10, 22)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(child:
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(89, 109, 246, 0.9),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'HIDE COMPLETED ITEMS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Task(title: 'Tidy Room', deadline: DateTime(2024, 10, 15), isStarred: true),
            ),
          ],
        ),
      ),
    );
  }
}

