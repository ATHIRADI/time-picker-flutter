import 'package:flutter/material.dart';
import 'package:time_picker/time_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedTimeString = "";

  void updateTime(TimeOfDay newTime) {
    if (selectedTime != newTime) {
      setState(() {
        selectedTime = newTime;
        selectedTimeString = selectedTime.format(context);
      });
    }
  }

  void cancelSelected() {
    setState(() {
      selectedTimeString = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Picker"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                timePicker(context, updateTime);
              },
              child: const Icon(
                Icons.timer,
                size: 80,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              selectedTimeString.isEmpty
                  ? ''
                  : 'Selected Time: $selectedTimeString',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            if (selectedTimeString.isNotEmpty)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.amberAccent,
                ),
                onPressed: cancelSelected,
                icon: const Icon(Icons.delete),
                label: const Text("Clear"),
              ),
          ],
        ),
      ),
    );
  }
}
