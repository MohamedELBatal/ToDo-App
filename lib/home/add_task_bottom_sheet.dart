import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
   AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime chosenDate = DateTime.now();

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Add New Task",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 26,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                label: const Text("Title"),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          const SizedBox(
            height: 26,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
                label: const Text("Description"),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          const SizedBox(
            height: 26,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Select Date",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              selectDate(context);
            },
            child:  Text(
              chosenDate.toString().substring(0,10),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: const Text(
                "Add Task",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectDate(BuildContext context)async {
    DateTime? selectDate = await showDatePicker(
      context: context,
      initialDate: chosenDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 360),
      ),
      selectableDayPredicate: (day) => day != DateTime.now().add(Duration(days: 2)),
    );
    if(selectDate!=null){chosenDate = selectDate;
    setState(() {

    });
    }
  }
}