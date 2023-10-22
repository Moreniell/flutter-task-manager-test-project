import 'package:flutter/material.dart';
import 'package:plandora/ui/screens/task_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 16),
          Icon(Icons.search),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          GestureDetector(
            child: const ListTile(
              leading: Icon(
                Icons.inbox,
                color: Colors.blue,
              ),
              title: Text('Inbox'),
              trailing: Text('12'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TaskListScreen(title: 'Inbox'),
                ),
              );
            },
          ),
          const ListTile(
            leading: Icon(
              Icons.star_border,
              color: Colors.deepOrange,
            ),
            title: Text('Starred'),
            trailing: Text('9'),
          ),
          const ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: Colors.green,
            ),
            title: Text('Today'),
            trailing: Text('6'),
          ),
          const ListTile(
            leading: Icon(
              Icons.receipt,
              color: Colors.grey,
            ),
            title: Text('List 1'),
            trailing: Text('2'),
          ),
          const ExpansionTile(
            leading: Icon(
              Icons.folder,
              color: Colors.grey,
            ),
            title: Text('Group of lists'),
            children: <Widget>[
              ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.receipt,
                      color: Colors.grey,
                    ),
                  ],
                ),
                title: Text('List 11'),
                trailing: Text('11'),
              ),
              ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.receipt,
                      color: Colors.grey,
                    ),
                  ],
                ),
                title: Text('List 12'),
                trailing: Text('6'),
              ),
              ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.receipt,
                      color: Colors.grey,
                    ),
                  ],
                ),
                title: Text('List 13'),
                trailing: Text('3'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: додавання списків
        },
        backgroundColor: Colors.indigoAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}