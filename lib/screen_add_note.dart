import 'package:flutter/material.dart';

enum ActionType {
  addnote,
  editnote,
}

class ScreenAddNote extends StatelessWidget {
  final ActionType type;
  String? id;
  ScreenAddNote({
    Key? key,
    required this.type,
    this.id,
  }) : super(key: key);

  Widget get saveButton => TextButton.icon(
        onPressed: () {
          switch (type) {
            case ActionType.addnote:
              //addnote
              break;
            case ActionType.editnote:
              //editnote
              break;
          }
        },
        icon: const Icon(
          Icons.save,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        label: const Text(
          'SAVE',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 171, 219, 159),
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: Center(child: Text(type.name.toUpperCase())),
          actions: [
            saveButton,
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 4,
                  maxLength: 100,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Content',
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
