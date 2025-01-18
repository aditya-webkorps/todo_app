import 'package:day15_todo/to_do_model.dart';
import 'package:flutter/material.dart';

import 'widget/custom_text_field_widget.dart';
import 'widget/repeat_chip_widget.dart';
import 'widget/set_reminder_widget.dart';

class CreateToDoPage extends StatefulWidget {
  const CreateToDoPage({super.key});

  @override
  State<CreateToDoPage> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDoPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  String selectedRepeatChip = "No Repeat";
  String selectedDay = "";

  Set<String> selectedDays = {};

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  void updateSelectedDays(String label) {
    if (selectedDays.contains(label)) {
      selectedDays.remove(label);
    } else {
      selectedDays.add(label);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Create to-do",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),

              // SET REMINDER
              const SetReminderWidget(),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Tell us about your task",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextFieldWidget(
                controller: _titleController,
                hint: "Title",
                maxLength: 100,
                minLines: 1,
                maxLines: 1,
                textType: TextInputType.text,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextFieldWidget(
                controller: _descriptionController,
                hint: "Description",
                maxLength: 500,
                minLines: 4,
                maxLines: 8,
                textType: TextInputType.multiline,
              ),

              const SizedBox(
                height: 10.0,
              ),

              const Text(
                "Repeat",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),

              Wrap(
                children: [
                  RepeatChipWidget(
                    label: "Daily",
                    isSelected: selectedRepeatChip == "Daily",
                    onItemClicked: (String label) {
                      setState(() {
                        selectedRepeatChip = label;
                      });
                    },
                  ),
                  RepeatChipWidget(
                    label: "Weekly",
                    isSelected: selectedRepeatChip == "Weekly",
                    onItemClicked: (String label) {
                      setState(() {
                        selectedRepeatChip = "Weekly";
                      });
                    },
                  ),
                  RepeatChipWidget(
                    label: "Monthly",
                    isSelected: selectedRepeatChip == "Monthly" ? true : false,
                    onItemClicked: (String label) {
                      setState(() {
                        selectedRepeatChip = "Monthly";
                      });
                    },
                  ),
                  RepeatChipWidget(
                    label: "No Repeat",
                    isSelected:
                        selectedRepeatChip == "No Repeat" ? true : false,
                    onItemClicked: (String label) {
                      setState(() {
                        selectedRepeatChip = "No Repeat";
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Wrap(
                children: [
                  RepeatChipWidget(
                    label: "Sunday",
                    isSelected: selectedDays.contains("Sunday"),
                    onItemClicked: (String label) {
                      setState(() {
                        updateSelectedDays(label);
                      });
                    },
                  ),
                  RepeatChipWidget(
                    label: "Monday",
                    isSelected: selectedDays.contains("Monday"),
                    onItemClicked: (String label) {
                      updateSelectedDays(label);
                    },
                  ),
                  RepeatChipWidget(
                    label: "Tuesday",
                    isSelected: selectedDays.contains("Tuesday"),
                    onItemClicked: (String label) {
                      updateSelectedDays(label);
                    },
                  ),
                  RepeatChipWidget(
                    label: "Wednesday",
                    isSelected: selectedDays.contains("Wednesday"),
                    onItemClicked: (String label) {
                      updateSelectedDays(label);
                    },
                  ),
                  RepeatChipWidget(
                    label: "Thursday",
                    isSelected: selectedDays.contains("Thursday"),
                    onItemClicked: (String label) {
                      updateSelectedDays(label);
                    },
                  ),
                  RepeatChipWidget(
                    label: "Friday",
                    isSelected: selectedDays.contains("Friday"),
                    onItemClicked: (String label) {
                      updateSelectedDays(label);
                    },
                  ),
                  RepeatChipWidget(
                    label: "Saturday",
                    isSelected: selectedDays.contains("Saturday"),
                    onItemClicked: (String label) {
                      updateSelectedDays(label);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      saveToDoClicked();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }

  bool validateUserInput() {
    if (_titleController.text.isEmpty) {
      return false;
    }
    if (_descriptionController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void saveToDoClicked() {
    if (validateUserInput()) {
      // 2. SAVE THE DATA
      var todo = ToDoModel(
        title: _titleController.text,
        description: _descriptionController.text,
        repeat: selectedRepeatChip,
        days: selectedDays,
        createdDate: DateTime.now(),
      );
      Navigator.of(context).pop(todo);
    } else {
      // 2. SHOW ERROR
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter valid input"),
        backgroundColor: Colors.purple,
        showCloseIcon: true,
      ));
    }
  }
}
