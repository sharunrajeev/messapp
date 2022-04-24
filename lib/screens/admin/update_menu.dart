import 'package:flutter/material.dart';
import 'package:messapp/widgets/primary_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messapp/widgets/snack_bar_message.dart';

class UpdateMenu extends StatefulWidget {
  const UpdateMenu({Key? key, required this.day_, required this.period_})
      : super(key: key);

  final String day_;
  final String period_;

  @override
  State<UpdateMenu> createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {
  CollectionReference meal = FirebaseFirestore.instance.collection('meal');
  final TextEditingController foodItem_ = TextEditingController();

  Future<void> updateUser(day, period, foodItem) {
    return meal.doc('$day').update({'$period': '$foodItem'}).then((value) {
      SnackBarMessage.snackBarMessage(
          content: "User added successfully", context: context);
    }).catchError((error) {
      SnackBarMessage.snackBarMessage(
          content: "Error: $error", context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: foodItem_,
          enableSuggestions: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autocorrect: false,
          decoration: const InputDecoration(
            labelText: "Edit",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 20,
        ),
        PrimaryButton(
          btnName: "Update",
          action: () {
            updateUser(
              widget.day_,
              widget.period_,
              foodItem_.text,
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
