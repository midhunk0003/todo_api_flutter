import 'package:flutter/material.dart';
import 'package:noteapp_api_flutter/screen_add_note.dart';

class ScreenAllNote extends StatefulWidget {
  const ScreenAllNote({Key? key}) : super(key: key);

  @override
  _ScreenAllNoteState createState() => _ScreenAllNoteState();
}

class _ScreenAllNoteState extends State<ScreenAllNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 171, 219, 159),
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Center(child: Text('ALL NOTES API')),
      ),
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          padding: EdgeInsets.all(20),
          children: List.generate(10, (index) {
            return NoteItem(
                id: index.toString(),
                title: 'Money $index',
                content:
                    'MONEY MNAGE SHJHSKJDHKHDKAHKJDHAKJDHKAJHDKJAHDKJAHDKJADHAKDHKAHDKHD $index');
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('ADD NEW NOTE');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) {
                return ScreenAddNote(
                  type: ActionType.addnote,
                );
              },
            ),
          );
        },
        label: const Text('NEW'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  final String id;
  final String title;
  final String content;

  const NoteItem({
    Key? key,
    required this.id,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('aaaaa');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return ScreenAddNote(
                type: ActionType.editnote,
                id: id,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 91, 207, 120),
          boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 107, 98, 98),
                offset: Offset.zero,
                blurRadius: 6,
                spreadRadius: 2,
                blurStyle: BlurStyle.normal)
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Text(
              content,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
