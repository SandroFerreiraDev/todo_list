import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo, required this.onDelete});

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6), color: Colors.grey[200]),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  DateFormat('dd/MM/yyyy - HH:mm').format(todo.dateTime),
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )),
        endActionPane: ActionPane(
          motion: BehindMotion(),
          extentRatio: 0.7,
          children: [
            SlidableAction(
              onPressed: (context) => onDelete(todo),
              backgroundColor: Colors.red,
              icon: Icons.delete,
            label: 'Deletar',),
            SlidableAction(
              onPressed: (context) => onDelete(todo),
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              label: 'Editar',)
          ],
        ),
      ),
    );
  }
}
