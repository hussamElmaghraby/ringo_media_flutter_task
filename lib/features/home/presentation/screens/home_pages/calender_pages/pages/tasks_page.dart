import 'package:flutter/material.dart';
import 'package:ringo_media/features/home/presentation/screens/home_pages/calender_pages/pages/widgets/task_item.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (_, idx) => TaskItemWidget(
        itemTitle: "Information Architecture",
        itemDesc: "Due Date : Mon, 12 Jan 2023",
        isSelected: isSelected,
        onChanged: (v) {
          isSelected = v!;
          setState(() {});
        },
      ),
    );
  }
}
