import 'package:flutter/material.dart';

class AddTaskInput extends StatefulWidget {
  final Function(String) onTaskAdded;

  const AddTaskInput({
    super.key,
    required this.onTaskAdded,
  });

  @override
  _AddTaskInputState createState() => _AddTaskInputState();
}

class _AddTaskInputState extends State<AddTaskInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(89, 109, 246, 0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.white),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'New to-do',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const Icon(Icons.star_border, color: Colors.white),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
