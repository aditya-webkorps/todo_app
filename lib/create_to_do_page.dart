import 'package:flutter/material.dart';

import 'widget/custom_text_field_widget.dart';
import 'widget/set_reminder_widget.dart';

class CreateToDoPage extends StatefulWidget {
  const CreateToDoPage({super.key});

  @override
  State<CreateToDoPage> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDoPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
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
                  Navigator.pop(context);
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

              const Wrap(
                children: [
                  RepeatChipWidget(label: "Daily"),
                  RepeatChipWidget(label: "Weekly"),
                  RepeatChipWidget(label: "Monthly"),
                  RepeatChipWidget(label: "No Repeat"),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Wrap(
                children: [
                  RepeatChipWidget(label: "Sunday"),
                  RepeatChipWidget(label: "Monday"),
                  RepeatChipWidget(label: "Tuesday"),
                  RepeatChipWidget(label: "Wednesday"),
                  RepeatChipWidget(label: "Thursday"),
                  RepeatChipWidget(label: "Friday"),
                  RepeatChipWidget(label: "Saturday"),
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
                      Navigator.pop(context);
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
}

class RepeatChipWidget extends StatelessWidget {
  const RepeatChipWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Colors.black26, width: 1.0)),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
