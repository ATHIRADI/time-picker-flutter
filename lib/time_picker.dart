import 'package:flutter/material.dart';

void timePicker(BuildContext context, Function(TimeOfDay) onTimeSelected) {
  TimeOfDay currentTime = TimeOfDay.now();

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text(
              "Select Time",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: currentTime,
                      );

                      if (newTime != null) {
                        setState(() {
                          currentTime = newTime;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          currentTime.format(context).toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  onTimeSelected(currentTime);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
